Attribute VB_Name = "ModFileType"
'I have designed this module for registering the archive type (.CyT file)
'instead of using a registry file to enter the type and theirs code in
'here to load the file extensions with their programs.

Option Explicit
'''''''''''''''''''''''''''Opening file extensions'''''''''''''''''''''''''''''''
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpszOp As String, ByVal lpszFile As String, ByVal lpszParams As String, ByVal lpszDir As String, ByVal FsShowCmd As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''Setting file types''''''''''''''''''''''''''''''''''''
'// Windows Registry Messages
Private Const REG_SZ As Long = 1
Private Const REG_DWORD As Long = 4
Private Const HKEY_CLASSES_ROOT = &H80000000
Private Const HKEY_CURRENT_USER = &H80000001
Private Const HKEY_LOCAL_MACHINE = &H80000002
Private Const HKEY_USERS = &H80000003

'// Windows Error Messages
Private Const ERROR_NONE = 0
Private Const ERROR_BADDB = 1
Private Const ERROR_BADKEY = 2
Private Const ERROR_CANTOPEN = 3
Private Const ERROR_CANTREAD = 4
Private Const ERROR_CANTWRITE = 5
Private Const ERROR_OUTOFMEMORY = 6
Private Const ERROR_INVALID_PARAMETER = 7
Private Const ERROR_ACCESS_DENIED = 8
Private Const ERROR_INVALID_PARAMETERS = 87
Private Const ERROR_NO_MORE_ITEMS = 259

'// Windows Security Messages
Private Const KEY_ALL_ACCESS = &H3F
Private Const REG_OPTION_NON_VOLATILE = 0

'// Windows Registry API calls
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''Opening file extensions'''''''''''''''''''''''''''''''
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegSetValue Lib "advapi32.dll" Alias "RegSetValueA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
Const SW_SHOWNORMAL = 1
Const SE_ERR_FNF = 2&
Const SE_ERR_PNF = 3&
Const SE_ERR_ACCESSDENIED = 5&
Const SE_ERR_OOM = 8&
Const SE_ERR_DLLNOTFOUND = 32&
Const SE_ERR_SHARE = 26&
Const SE_ERR_ASSOCINCOMPLETE = 27&
Const SE_ERR_DDETIMEOUT = 28&
Const SE_ERR_DDEFAIL = 29&
Const SE_ERR_DDEBUSY = 30&
Const SE_ERR_NOASSOC = 31&
Const ERROR_BAD_FORMAT = 11&


'''''''''''''''''''''''''''Setting file types'''''''''''''''''''''''''''''''''''
Const ERROR_SUCCESS = 0&
Private Const MAX_PATH = 260&
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''Setting file types'''''''''''''''''''''''''''''''''''
Public Sub RegisterArchiveType()
    
    Dim sPath As String
    Dim fileEx As String
    Dim Discription As String
    
    fileEx = ".CyT"
    Discription = "CyTFile"

    CreateNewKey fileEx, HKEY_CLASSES_ROOT
    SetKeyValue fileEx, "", Discription, REG_SZ
    CreateNewKey Discription & "\shell\Open in CyberCrypt\command", HKEY_CLASSES_ROOT
    CreateNewKey Discription & "\DefaultIcon", HKEY_CLASSES_ROOT
    SetKeyValue Discription & "\DefaultIcon", "", App.Path & "\" & App.EXEName & ".exe,0", REG_SZ
    SetKeyValue Discription, "", "CyberCrypt file", REG_SZ
    sPath = App.Path & "\" & App.EXEName & ".exe %1"
    SetKeyValue Discription & "\shell\Open in CyberCrypt\command", "", sPath, REG_SZ

End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Private Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long

  Dim nValue As Long
  Dim sValue As String

  Select Case lType
    Case REG_SZ
      sValue = vValue & Chr$(0)
      SetValueEx = RegSetValueExString(hKey, _
        sValueName, 0&, lType, sValue, Len(sValue))

    Case REG_DWORD
      nValue = vValue
      SetValueEx = RegSetValueExLong(hKey, sValueName, _
        0&, lType, nValue, 4)

  End Select
   
End Function

Private Sub CreateNewKey(sNewKeyName As String, lPredefinedKey As Long)

  '// handle to the new key
  Dim hKey As Long
  
  '// result of the RegCreateKeyEx function
  Dim r As Long
   
  r = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, _
    vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hKey, r)

  Call RegCloseKey(hKey)

End Sub

Private Sub SetKeyValue(sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long)

  '// result of the SetValueEx function
  Dim r As Long
   
  '// handle of opened key
  Dim hKey As Long
   
  '// open the specified key
  r = RegOpenKeyEx(HKEY_CLASSES_ROOT, sKeyName, 0, _
    KEY_ALL_ACCESS, hKey)

  r = SetValueEx(hKey, sValueName, lValueType, vValueSetting)

  Call RegCloseKey(hKey)

End Sub

'''''''''''''''''''''''''''Opening file extensions'''''''''''''''''''''''''''''''
Function StartDoc(DocName As String) As Long
    Dim Scr_hDC As Long
    Scr_hDC = GetDesktopWindow()
    StartDoc = ShellExecute(Scr_hDC, "Open", DocName, "", "", SW_SHOWNORMAL)
End Function

Public Function ExFile(Filen As String)
    Dim r As Long, msg As String
    r = StartDoc(Filen) ' ' Change this to a valid path
    If r <= 32 Then
        'There was an error
        Select Case r
            Case SE_ERR_FNF
                msg = "File not found."
            Case SE_ERR_PNF
                msg = "Path not found."
            Case SE_ERR_ACCESSDENIED
                msg = "Access denied."
            Case SE_ERR_OOM
                msg = "Out of memory."
            Case SE_ERR_DLLNOTFOUND
                msg = "DLL not found."
            Case SE_ERR_SHARE
                msg = "A sharing violation occurred."
            Case SE_ERR_ASSOCINCOMPLETE
                msg = "Incomplete or invalid file association."
            Case SE_ERR_DDETIMEOUT
                msg = "DDE Time out."
            Case SE_ERR_DDEFAIL
                msg = "DDE transaction failed."
            Case SE_ERR_DDEBUSY
                msg = "DDE busy."
            Case SE_ERR_NOASSOC
                msg = "No association for file extension."
            Case ERROR_BAD_FORMAT
                msg = "Invalid EXE file or error in EXE image."
            Case Else
                msg = "An unknown error occured."
        End Select
        MessageBox msg & " (You may have to extract the file(s) to open it.)", OKOnly, Critical
    End If
End Function
