   Attribute VB_Name = "my_api"
   Option Explicit

   Public Const HKEY_CURRENT_USER = &H80000001
   Public Const HKEY_LOCAL_MACHINE = &H80000002
   Public Const KEY_QUERY_VALUE = &H1
   Public Const ERROR_SUCCESS = 0
   Public Const KEY_WRITE = &H20006
   Public Const REG_SZ = 1
   Public Const FLAG_ICC_FORCE_CONNECTION = &H1
   Public Const SW_NORMAL = 1

   Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
   Public Declare Sub ExitProcess Lib "kernel32" (ByVal procExitCode As Long)
   Public Declare Sub RegCreateKeyEx Lib "ADVAPI32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, ByRef phkResult As Long, ByRef lpdwDisposition As Long)
   Public Declare Function RegOpenKeyEx Lib "ADVAPI32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
   Public Declare Function RegCloseKey Lib "ADVAPI32.dll" (ByVal hKey As Long) As Long
   Public Declare Function RegSetValueEx Lib "ADVAPI32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbdata As Long) As Long
   Public Declare Function InternetCheckConnection Lib "wininet.dll" Alias "InternetCheckConnectionA" (ByVal lpszUrl As String, ByVal dwFlags As Long, ByVal dwReserved As Long) As Long
   Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" _
     (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, _
     ByVal lpParameters As String, ByVal lpDirectory As String, _
     ByVal nShowCmd As Long) As Long
