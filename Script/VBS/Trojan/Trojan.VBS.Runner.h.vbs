DIM objShell
set objShell=wscript.createObject("wscript.shell")
iReturn=objShell.Run("cmd.exe /C %systemroot%\temp\123.bat", 0, TRUE)