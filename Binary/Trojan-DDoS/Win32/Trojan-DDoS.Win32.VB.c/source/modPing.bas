Attribute VB_Name = "modPing"
Private Type WSAdata
   wVersion As Integer
   wHighVersion As Integer
   szDescription(0 To 255) As Byte
   szSystemStatus(0 To 128) As Byte
   iMaxSockets As Integer
   iMaxUdpDg As Integer
   lpVendorInfo As Long
End Type

Private Type Hostent
   h_name As Long
   h_aliases As Long
   h_addrtype As Integer
   h_length As Integer
   h_addr_list As Long
End Type

Private Type IP_OPTION_INFORMATION
   TTL As Byte
   Tos As Byte
   Flags As Byte
   OptionsSize As Long
   OptionsData As String * 128
End Type

Private Type IP_ECHO_REPLY
   Address(0 To 3) As Byte
   Status As Long
   RoundTripTime As Long
   DataSize As Integer
   Reserved As Integer
   data As Long
   Options As IP_OPTION_INFORMATION
End Type

Private Declare Function GetHostByName Lib "wsock32.dll" Alias "gethostbyname" (ByVal Hostname As String) As Long
Private Declare Function WSAStartup Lib "wsock32.dll" (ByVal wVersionRequired&, lpWSAdata As WSAdata) As Long
Private Declare Function WSACleanup Lib "wsock32.dll" () As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Declare Function IcmpCreateFile Lib "icmp.dll" () As Long
Private Declare Function IcmpCloseHandle Lib "icmp.dll" (ByVal HANDLE As Long) As Boolean
Private Declare Function IcmpSendEcho Lib "ICMP" (ByVal IcmpHandle As Long, ByVal DestAddress As Long, ByVal RequestData As String, ByVal RequestSize As Integer, RequestOptns As IP_OPTION_INFORMATION, ReplyBuffer As IP_ECHO_REPLY, ByVal ReplySize As Long, ByVal TimeOut As Long) As Boolean

Private Const SOCKET_ERROR = 0


Public Function Ping(ByVal Server As String) As Long
   Dim hFile As Long, lpWSAdata As WSAdata
   Dim hHostent As Hostent, AddrList As Long
   Dim Address As Long, rIP As String
   Dim OptInfo As IP_OPTION_INFORMATION
   Dim EchoReply As IP_ECHO_REPLY
   Dim Hostname As String


   Ping = 0 'Rückgabe anfangs auf null setzen
   If Left(Server, 7) = "http://" Then Server = Mid(Server, 8) 'http:// entfernen

   Call WSAStartup(&H101, lpWSAdata)

   If GetHostByName(Server + String(64 - Len(Server), 0)) <> SOCKET_ERROR Then
      CopyMemory hHostent.h_name, ByVal GetHostByName(Server + String(64 - Len(Server), 0)), Len(hHostent)
      CopyMemory AddrList, ByVal hHostent.h_addr_list, 4
      CopyMemory Address, ByVal AddrList, 4
   End If

   hFile = IcmpCreateFile()
   If hFile = 0 Then Exit Function 'Bei Fehler abbrechen

   OptInfo.TTL = 255

   'Ping senden
   If IcmpSendEcho(hFile, Address, String(32, "A"), 32, OptInfo, EchoReply, Len(EchoReply) + 8, 2000) Then
      rIP = CStr(EchoReply.Address(0)) + "." + CStr(EchoReply.Address(1)) + "." + CStr(EchoReply.Address(2)) + "." + CStr(EchoReply.Address(3))
   Else
      'Fehler aufgetreten
      Exit Function
   End If

   If EchoReply.Status = 0 Then
      Ping = EchoReply.RoundTripTime
   Else
      'Keine Antwort bekommen
   End If
End Function
