DIM objShell
set objShell=wscript.createObject("wscript.shell")
iReturn=objShell.Run("cmd.exe /C  %systemroot%\mui\2.bat", 0, TRUE)