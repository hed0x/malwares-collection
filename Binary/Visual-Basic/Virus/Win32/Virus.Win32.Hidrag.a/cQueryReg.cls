   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
     Persistable = 0  'NotPersistable
     DataBindingBehavior = 0  'vbNone
     DataSourceBehavior  = 0  'vbNone
     MTSTransactionMode  = 0  'NotAnMTSObject
   END
   Attribute VB_Name = "cQueryReg"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = True
   Attribute VB_PredeclaredId = False
   Attribute VB_Exposed = False
   'Gracias a el Guille por este rollo de código.
   'Básicamente lo que hace es enumerar los valores del registro
   Dim colShellFolders As Collection
   Dim colShellFoldersKey As Collection

   ' Registry manipulation API's (32-bit)

   'Claves del Registro
   Public Enum eHKEY
       HKEY_CLASSES_ROOT = &H80000000
       HKEY_CURRENT_USER = &H80000001
       HKEY_LOCAL_MACHINE = &H80000002
       HKEY_USERS = &H80000003
       '
       HKEY_CURRENT_CONFIG = &H80000005
       HKEY_DYN_DATA = &H80000006
   End Enum
   Public Enum eHKEYError
       ERROR_SUCCESS = 0
       ERROR_FILE_NOT_FOUND = 2&
       ERROR_ACCESS_DENIED = 5&
       ERROR_MORE_DATA = 234&
       ERROR_NO_MORE_ITEMS = 259&
       ERROR_BADKEY = 1010&
   End Enum
   Public Enum eHKEYDataType
       REG_NONE = 0&
       REG_SZ = 1&

       REG_BINARY = 3
       REG_DWORD = 4
   End Enum

   Const SYNCHRONIZE = &H100000
   Const READ_CONTROL = &H20000
   Const STANDARD_RIGHTS_ALL = &H1F0000
   Const STANDARD_RIGHTS_REQUIRED = &HF0000
   Const STANDARD_RIGHTS_EXECUTE = (READ_CONTROL)
   Const STANDARD_RIGHTS_READ = (READ_CONTROL)
   Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)

   Public Enum eREGSAM

       KEY_QUERY_VALUE = &H1
       KEY_SET_VALUE = &H2
       KEY_CREATE_SUB_KEY = &H4
       KEY_ENUMERATE_SUB_KEYS = &H8
       KEY_NOTIFY = &H10
       KEY_CREATE_LINK = &H20

       KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
       KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))

       KEY_EXECUTE = ((KEY_READ) And (Not SYNCHRONIZE))

       KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) And (Not SYNCHRONIZE))

   End Enum

   Private Type FILETIME
       dwLowDateTime As Long
       dwHighDateTime As Long
   End Type

   Private Declare Function RegQueryInfoKey Lib "advapi32.dll" Alias "RegQueryInfoKeyA" _
       (ByVal hKey As Long, ByVal lpClass As String, lpcbClass As Long, _
       lpReserved As Long, lpcSubKeys As Long, lpcbMaxSubKeyLen As Long, _
       lpcbMaxClassLen As Long, lpcValues As Long, lpcbMaxValueNameLen As Long, _
       lpcbMaxValueLen As Long, lpcbSecurityDescriptor As Long, _
       lpftLastWriteTime As FILETIME) As Long
   Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" _
       (ByVal hKey As Long, ByVal lpSubKey As String, _
       ByVal ulOptions As Long, ByVal samDesired As Long, _
       phkResult As Long) As Long
   Private Declare Function RegCloseKey Lib "advapi32.dll" _
       (ByVal hKey As Long) As Long

   Private Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" _
       (ByVal hKey As Long, ByVal dwIndex As Long, _
       ByVal lpValueName As String, lpcbValueName As Long, _
       lpReserved As Long, lpType As Long, lpData As Any, _
       lpcbData As Long) As Long
   Private Function ParseKey(sKey As String, Optional ByVal hKey As eHKEY = HKEY_CURRENT_USER) As eHKEY
       Dim i As Long
       Dim sRootKey As String

       i = InStr(sKey, "HKEY_")
       If i Then
           i = InStr(sKey, "\")
           If i Then
               sRootKey = Left$(sKey, i - 1)
               sKey = Mid$(sKey, i + 1)
           Else
               sRootKey = sKey
               sKey = ""
           End If
       'Por si se usan abreviaturas de las claves
       ElseIf Left$(sKey, 5) = "HKCR\" Then
           sRootKey = "HKEY_CLASSES_ROOT"
           sKey = Mid$(sKey, 6)
       ElseIf Left$(sKey, 5) = "HKCU\" Then
           sRootKey = "HKEY_CURRENT_USER"
           sKey = Mid$(sKey, 6)
       ElseIf Left$(sKey, 5) = "HKLM\" Then
           sRootKey = "HKEY_LOCAL_MACHINE"
           sKey = Mid$(sKey, 6)
       ElseIf Left$(sKey, 4) = "HKU\" Then
           sRootKey = "HKEY_USERS"
           sKey = Mid$(sKey, 5)
       ElseIf Left$(sKey, 5) = "HKCC\" Then
           sRootKey = "HKEY_CURRENT_CONFIG"
           sKey = Mid$(sKey, 6)
       ElseIf Left$(sKey, 5) = "HKDD\" Then
           sRootKey = "HKEY_DYN_DATA"
           sKey = Mid$(sKey, 6)
       Else
           Select Case hKey
           Case HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_LOCAL_MACHINE, HKEY_USERS, HKEY_CURRENT_CONFIG, HKEY_DYN_DATA
           Case Else
               hKey = HKEY_CLASSES_ROOT
           End Select
       End If
       If Len(sRootKey) Then
           Select Case sRootKey
           Case "HKEY_CLASSES_ROOT"
               hKey = HKEY_CLASSES_ROOT
           Case "HKEY_CURRENT_USER"
               hKey = HKEY_CURRENT_USER
           Case "HKEY_LOCAL_MACHINE"
               hKey = HKEY_LOCAL_MACHINE
           Case "HKEY_USERS"
               hKey = HKEY_USERS
           Case "HKEY_CURRENT_CONFIG"
               hKey = HKEY_CURRENT_CONFIG
           Case "HKEY_DYN_DATA"
               hKey = HKEY_DYN_DATA
           Case Else
               hKey = HKEY_CLASSES_ROOT
           End Select
       End If

       ParseKey = hKey
   End Function
   Public Function CloseKey(ByVal hKey As Long) As Long
       CloseKey = RegCloseKey(hKey)
   End Function

   Private Sub Class_Initialize()
       Set colShellFolders = New Collection
       Set colShellFoldersKey = New Collection
   End Sub

   Private Sub Class_Terminate()
       Set colShellFolders = Nothing
       Set colShellFoldersKey = Nothing
   End Sub

   Private Function RTrimZero(ByVal sString As String) As String
       'Devuelve una cadena hasta el primer Chr$(0)                (12/Oct/98)
       Dim i As Long

       i = InStr(sString, Chr$(0))
       If i Then
           sString = Left$(sString, i - 1)
       End If
       RTrimZero = sString
   End Function

   Public Function EnumValues(ByRef colKeys() As String, ByVal sKey As String) As Boolean

       Dim dwIndex             As Long
       Dim ret                 As Long
       Dim hKey2               As Long
       Dim hKey                As Long
       Dim lpName              As String
       Dim lpftLastWriteTime   As FILETIME
       Dim retDT               As eHKEYDataType
       Dim lSize               As Long
       Dim sData               As String
       Dim aData()             As Byte
       Dim lDWord              As Long
       Dim i                   As Long
       Dim colItems            As Long
       Dim SubKeysNum          As Long
       Dim MaxSubKeyLen        As Long
       Dim numValues           As Long
       Dim MaxValueNameLen     As Long
       Dim MaxDataLen          As Long
       hKey = ParseKey(sKey, hKey)
       ret = RegOpenKeyEx(hKey, sKey, 0&, KEY_QUERY_VALUE, hKey2)
       EnumValues = True
       ReDim aData(0)
       lDWord = 0
       sData = ""
       colItems = 0
       ReDim colKeys(colItems)
       If ret = ERROR_SUCCESS Then
           ret = RegQueryInfoKey(hKey2, 0&, 0&, 0&, SubKeysNum, MaxSubKeyLen, _
                               0&, numValues, MaxValueNameLen, _
                               MaxDataLen, 0&, lpftLastWriteTime)

           lpName = String$(MaxValueNameLen + 1, 0)
           For dwIndex = 0 To numValues
               lpName = String$(MaxValueNameLen + 1, 0)
               ret = RegEnumValue(hKey2, dwIndex, 0&, 0&, 0&, retDT, 0&, 0&)
               If ret = ERROR_MORE_DATA Or ret = ERROR_SUCCESS Then
                   lSize = MaxDataLen
                   Select Case retDT
                   Case REG_SZ 'Datos de cadena
                       sData = String$(lSize, 0)
                       ret = RegEnumValue(hKey2, dwIndex, lpName, Len(lpName), 0&, retDT, ByVal sData, lSize)
                       sData = RTrimZero(sData)
                       lpName = RTrimZero(lpName)
                       ReDim Preserve colKeys(colItems + 2)
                       colKeys(colItems + 1) = lpName
                       colKeys(colItems + 2) = sData
                       colItems = colItems + 2
                   Case REG_DWORD
                       'Datos numéricos (long)
                       ret = RegEnumValue(hKey2, dwIndex, lpName, Len(lpName), 0&, retDT, lDWord, lSize)
                       sData = CStr(lDWord)
                       lpName = RTrimZero(lpName)
                       ReDim Preserve colKeys(colItems + 2)
                       colKeys(colItems + 1) = lpName
                       colKeys(colItems + 2) = sData
                       colItems = colItems + 2
                   Case Else
                       If lSize Then
                           ReDim aData(lSize)
                           ret = RegEnumValue(hKey2, dwIndex, lpName, Len(lpName), 0&, retDT, aData(0), lSize)
                           lpName = RTrimZero(lpName)
                           sData = ""
                           For i = 0 To UBound(aData) - 1
                               sData = sData & Format$(Hex$(aData(i)), "00") & " "
                           Next
                           ReDim Preserve colKeys(colItems + 2)
                           colKeys(colItems + 1) = lpName
                           colKeys(colItems + 2) = sData
                           colItems = colItems + 2
                       End If
                   End Select
               End If
           Next
       Else
           EnumValues = False
       End If
       ret = CloseKey(hKey2)
   End Function
