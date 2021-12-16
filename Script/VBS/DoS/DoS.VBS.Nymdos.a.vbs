On Error Resume Next
set wsTCP=CreateObject("oswinsck.TCP")
Head = "GET " & "http://www.nymex.com" & " HTTP/1.0" & vbCrLf & "Accept: */*" & vbCrLf & "User-Agent: " & "Mozilla/4.0 (compatible; MSIE 6.0; Win32)" & vbcrlf & "Host: 192.33.88.239" & vbCrLf & vbCrLf
Do
If wsTCP.Connect("proxy.starhub.net.sg", 8080) = 0 Then
wsTCP.SendData Head
wsTCP.Disconnect
End If
loop
