   Attribute VB_Name = "Connect"
   Option Explicit
   Public Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef lpSFlags As Long, ByVal dwReserved As Long) As Long
   Public Const INTERNET_CONNECTION_LAN As Long = &H2
   Public Const INTERNET_CONNECTION_MODEM As Long = &H1
   Public Function online() As Boolean
   online = InternetGetConnectedState(0&, 0&)
   End Function
