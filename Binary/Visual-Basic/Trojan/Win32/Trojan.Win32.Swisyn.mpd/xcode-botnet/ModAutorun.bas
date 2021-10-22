Attribute VB_Name = "ModAutorun"
Private Const KEY_READ = &H20000 Or &H1& Or &H8& Or &H10&
Private Const KEY_WRITE = &H20000 Or &H2& Or &H4&
Public Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long

Public Const HKCU = &H80000001
Public Const HKLM = &H80000002
Private Const REG_SZ = 1
Private Const REG_DWORD = 4
Private Const ERROR_SUCCESS = 0&

Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hkey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hkey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hkey As Long) As Long

Public Function BuatDword(ByVal hkey As Long, ByVal alamat As String, ByVal nama As String, ByVal nilai As Long) As Boolean
    Dim handle As Long
    Dim hasil As Long
    hasil = RegOpenKeyEx(hkey, alamat, 0, KEY_WRITE, handle)
    If hasil <> ERROR_SUCCESS Then
        BuatDword = False
    Else
        BuatDword = True
    End If
    RegSetValueEx handle, nama, 0&, REG_DWORD, nilai, 4&
    RegCloseKey handle
End Function

Public Function BuatString(ByVal hkey As Long, ByVal alamat As String, ByVal nama As String, ByVal nilai As String) As Boolean
    Dim handle As Long
    Dim hasil As Long
    hasil = RegOpenKeyEx(hkey, alamat, 0, KEY_WRITE, handle)
    If hasil <> ERROR_SUCCESS Then
        BuatString = False
    Else
        BuatString = True
    End If
    RegSetValueEx handle, nama, 0, REG_SZ, ByVal nilai, Len(nilai)
    RegCloseKey handle
End Function

Public Function AmbilDword(ByVal hkey As Long, ByVal alamat As String, nama As String) As Long
    On Error Resume Next
    Dim handle As Long
    RegOpenKeyEx hkey, alamat, 0, KEY_READ, handle
    AmbilDword = RegQueryValue(handle, nama)
    RegCloseKey handle
End Function

Public Function AmbilString(ByVal hkey As Long, ByVal alamat As String, ByVal nama As String) As String
    On Error Resume Next
    Dim handle As Long
    RegOpenKeyEx hkey, alamat, 0, KEY_READ, handle
    AmbilString = RegQueryValue(handle, nama)
    RegCloseKey handle
End Function

Private Function RegQueryValue(ByVal hkey As Long, ByVal strValueName As String) As String
    Dim hasil As Long
    Dim Jenis As Long
    Dim Buffer As String
    Dim Ukuran As Long
    
    hasil = RegQueryValueEx(hkey, strValueName, 0, Jenis, ByVal 0, Ukuran)
    If hasil = 0 Then
        If Jenis = REG_SZ Then
            Buffer = String(Ukuran, Chr$(0))
            hasil = RegQueryValueEx(hkey, strValueName, 0, 0, ByVal Buffer, Ukuran)
            If hasil = 0 Then RegQueryValue = Left$(Buffer, InStr(1, Buffer, Chr$(0)) - 1)
        ElseIf Jenis = REG_DWORD Then
            Dim strdata As Integer
            hasil = RegQueryValueEx(hkey, strValueName, 0, 0, strdata, Ukuran)
            If hasil = 0 Then RegQueryValue = strdata
        End If
    End If
End Function

