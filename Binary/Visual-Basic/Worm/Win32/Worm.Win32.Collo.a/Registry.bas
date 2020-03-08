   Attribute VB_Name = "Registry"
   Public Const HKEY_CLASSES_ROOT = &H80000000
   Public Const HKEY_CURRENT_USER = &H80000001
   Public Const HKEY_LOCAL_MACHINE = &H80000002
   Public Const HKEY_USERS = &H80000003
   Public Const HKEY_PERFORMANCE_DATA = &H80000004
   Public Const ERROR_SUCCESS = 0&
   Declare Function RegOpenKey Lib "Advapi32.dll" Alias "RegOpenKeyA" (ByVal Hkey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
   Declare Function RegQueryValueEx Lib "Advapi32.dll" Alias "RegQueryValueExA" (ByVal Hkey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
   Public Const REG_SZ = 1
   Public Function getstring(Hkey As Long, strPath As String, strValue As String)
   Dim keyhand As Long
   Dim datatype As Long
   Dim lResult As Long
   Dim strBuf As String
   Dim lDataBufSize As Long
   Dim intZeroPos As Integer
   r = RegOpenKey(Hkey, strPath, keyhand)
   lResult = RegQueryValueEx(keyhand, strValue, 0&, lValueType, ByVal 0&, lDataBufSize)
   If lValueType = REG_SZ Then
       strBuf = String(lDataBufSize, " ")
       lResult = RegQueryValueEx(keyhand, strValue, 0&, 0&, ByVal strBuf, lDataBufSize)
       If lResult = ERROR_SUCCESS Then
           intZeroPos = InStr(strBuf, Chr$(0))
           If intZeroPos > 0 Then
               getstring = Left$(strBuf, intZeroPos - 1)
           Else
               getstring = strBuf
           End If
       End If
   End If
   End Function
