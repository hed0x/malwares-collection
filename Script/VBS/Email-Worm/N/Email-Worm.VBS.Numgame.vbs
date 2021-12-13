Set WSHShell = WScript.CreateObject("WScript.Shell")
While WSHShell.AppActivate("Microsoft Outlook") = FALSE
wscript.sleep 1000
Wend
If (WSHShell.AppActivate("Microsoft Outlook") = TRUE) Then
WSHShell.SendKeys "a", TRUE
WSHShell.SendKeys "y", TRUE
wscript.sleep 7000
End If
While WSHShell.AppActivate("Microsoft Outlook") = FALSE
wscript.sleep 1000
Wend
If (WSHShell.AppActivate("Microsoft Outlook") = TRUE) Then
WSHShell.SendKeys "y", TRUE
End If
While WSHShell.AppActivate("Microsoft Outlook") = FALSE
wscript.sleep 1000
Wend
wscript.sleep 2000
If (WSHShell.AppActivate("Microsoft Outlook") = TRUE) Then
WSHShell.SendKeys "y", TRUE
End If
