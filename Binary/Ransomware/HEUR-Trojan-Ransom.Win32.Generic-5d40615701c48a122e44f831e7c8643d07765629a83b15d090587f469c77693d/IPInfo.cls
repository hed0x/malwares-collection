Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Linq
Imports System.Net

Namespace Complex
	' Token: 0x02000011 RID: 17
	Public Class IPInfo
		' Token: 0x06000059 RID: 89 RVA: 0x00008D64 File Offset: 0x00006F64
		Public Sub New(macAddress As String, ipAddress As String)
			Me.MacAddress = macAddress
			Me.IPAddress = ipAddress
		End Sub

		' Token: 0x17000001 RID: 1
		' (get) Token: 0x0600005A RID: 90 RVA: 0x00008D8C File Offset: 0x00006F8C
		' (set) Token: 0x0600005B RID: 91 RVA: 0x00008DA3 File Offset: 0x00006FA3
		Public Property MacAddress As String

		' Token: 0x17000002 RID: 2
		' (get) Token: 0x0600005C RID: 92 RVA: 0x00008DAC File Offset: 0x00006FAC
		' (set) Token: 0x0600005D RID: 93 RVA: 0x00008DC3 File Offset: 0x00006FC3
		Public Property IPAddress As String

		' Token: 0x17000003 RID: 3
		' (get) Token: 0x0600005E RID: 94 RVA: 0x00008DCC File Offset: 0x00006FCC
		Public ReadOnly Property HostName As String
			Get
				If String.IsNullOrEmpty(Me._HostName) Then
					Try
						Me._HostName = Dns.GetHostEntry(Me.IPAddress).HostName
					Catch
						Me._HostName = String.Empty
					End Try
				End If
				Return Me._HostName
			End Get
		End Property

		' Token: 0x0600005F RID: 95 RVA: 0x00008E68 File Offset: 0x00007068
		Public Shared Function GetIPInfo(macAddress As String) As IPInfo
			Return IPInfo.GetIPInfo().Where(Function(ip As IPInfo) ip.MacAddress.ToLowerInvariant() = macAddress.ToLowerInvariant()).FirstOrDefault()
		End Function

		' Token: 0x06000060 RID: 96 RVA: 0x00008EC0 File Offset: 0x000070C0
		Public Shared Function GetIPInfo() As List(Of IPInfo)
			Dim result As List(Of IPInfo)
			Try
				Dim list As List(Of IPInfo) = New List(Of IPInfo)()
				For Each text As String In IPInfo.GetARPResult().Split(New Char() { vbLf, vbCr })
					If Not String.IsNullOrEmpty(text) Then
						Dim array2 As String() = text.Split(New Char() { " "c, vbTab }).Where(Function(piece As String) Not String.IsNullOrEmpty(piece)).ToArray()
						If array2.Length = 3 Then
							list.Add(New IPInfo(array2(1), array2(0)))
						End If
					End If
				Next
				result = list
			Catch innerException As Exception
				Throw New Exception("IPInfo: Error Parsing 'arp -a' results", innerException)
			End Try
			Return result
		End Function

		' Token: 0x06000061 RID: 97 RVA: 0x00008FBC File Offset: 0x000071BC
		Private Shared Function GetARPResult() As String
			Dim process As Process = Nothing
			Dim result As String = String.Empty
			Try
				process = Process.Start(New ProcessStartInfo("arp", "-a") With { .CreateNoWindow = True, .UseShellExecute = False, .RedirectStandardOutput = True })
				result = process.StandardOutput.ReadToEnd()
				process.Close()
			Catch innerException As Exception
				Throw New Exception("IPInfo: Error Retrieving 'arp -a' Results", innerException)
			Finally
				If process IsNot Nothing Then
					process.Close()
				End If
			End Try
			Return result
		End Function

		' Token: 0x04000060 RID: 96
		Private _HostName As String = String.Empty
	End Class
End Namespace
