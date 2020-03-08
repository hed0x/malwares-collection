   Attribute VB_Name = "Registry"
   Public Const HKEY_CLASSES_ROOT = &H80000000
   Public Const HKEY_CURRENT_USER = &H80000001
   Public Const HKEY_LOCAL_MACHINE = &H80000002
   Public Const ERROR_SUCCESS = 0&
   Declare Function RegCloseKey Lib "Advapi32.dll" (ByVal Hkey As Long) As Long
   Declare Function RegCreateKey Lib "Advapi32.dll" Alias "RegCreateKeyA" (ByVal Hkey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
   Declare Function RegDeleteValue Lib "Advapi32.dll" Alias "RegDeleteValueA" (ByVal Hkey As Long, ByVal lpValueName As String) As Long
   Declare Function RegOpenKey Lib "Advapi32.dll" Alias "RegOpenKeyA" (ByVal Hkey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
   Declare Function RegQueryValueEx Lib "Advapi32.dll" Alias "RegQueryValueExA" (ByVal Hkey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
   Declare Function RegSetValueEx Lib "Advapi32.dll" Alias "RegSetValueExA" (ByVal Hkey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
   Public Const REG_SZ = 1
   Public Const REG_DWORD = 4
   Public Sub savekey(Hkey As Long, strPath As String)
   Dim keyhand&
   r = RegCreateKey(Hkey, strPath, keyhand&)
   r = RegCloseKey(keyhand&)
   End Sub
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
   Public Sub savestring(Hkey As Long, strPath As String, strValue As String, strdata As String)
   Dim keyhand As Long
   Dim r As Long
   r = RegCreateKey(Hkey, strPath, keyhand)
   r = RegSetValueEx(keyhand, strValue, 0, REG_SZ, ByVal strdata, Len(strdata))
   r = RegCloseKey(keyhand)
   End Sub
   Function getdword(ByVal Hkey As Long, ByVal strPath As String, ByVal strValueName As String) As Long
   Dim lResult As Long
   Dim lValueType As Long
   Dim lBuf As Long
   Dim lDataBufSize As Long
   Dim r As Long
   Dim keyhand As Long
   r = RegOpenKey(Hkey, strPath, keyhand)
   lDataBufSize = 4
   lResult = RegQueryValueEx(keyhand, strValueName, 0&, lValueType, lBuf, lDataBufSize)
   If lResult = ERROR_SUCCESS Then
       If lValueType = REG_DWORD Then
           getdword = lBuf
       End If
   End If
   r = RegCloseKey(keyhand)
   End Function
   Function SaveDword(ByVal Hkey As Long, ByVal strPath As String, ByVal strValueName As String, ByVal lData As Long)
       Dim lResult As Long
       Dim keyhand As Long
       Dim r As Long
       r = RegCreateKey(Hkey, strPath, keyhand)
       lResult = RegSetValueEx(keyhand, strValueName, 0&, REG_DWORD, lData, 4)
       r = RegCloseKey(keyhand)
   End Function
   Public Function DeleteValue(ByVal Hkey As Long, ByVal strPath As String, ByVal strValue As String)
   Dim keyhand As Long
   r = RegOpenKey(Hkey, strPath, keyhand)
   r = RegDeleteValue(keyhand, strValue)
   r = RegCloseKey(keyhand)
   End Function
